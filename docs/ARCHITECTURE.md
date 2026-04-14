# Arquitectura de Alixar

Alixar representa la separación física del core monolítico heredado del ERP clásico, abrazando una topología **Headless**, y orquestando el modelo de negocio Backend mediante **Arquitectura Hexagonal (Ports & Adapters)**.

## 1. Visión Global (Server-Driven UI)

La orquestación principal del ERP recae en comunicar un Frontend Reactivo con un Backend puramente API:

```mermaid
graph LR
    subgraph Frontend (Vue 3 + Vite)
        A[Router] --> B[Views]
        B --> C[GenericFichaTab]
        C --> D[DynamicFormEngine]
    end
    
    subgraph Backend Core (PHP 8.3 Hexagonal)
        API[API Resource Controllers]
        API --> U[Application UseCases]
        U --> DOM[Domain Entities & Ports]
        DOM --> INF[Infrastructure Repositories]
    end
    
    D <-.-> |GET/POST Schemas & Data| API
    C <-.-> |Navigation Logic / Guards| API
```

Para asegurar una consistencia rigurosa, se emplea fuertemente el patrón SDUI (**Server-Driven UI**). El frontend (construido en Vue 3) está centralizado, de manera que la declaración de esquemas desde el backend es capaz de renderizar los formularios, diccionarios y validaciones complejas de cliente automáticamente, usando un registro central (`schemaRegistry.ts`).

## 2. Paradigma Backend Hexagonal

La lógica centralizada en `src/` abandona el Active Record pesado (como Laravel/Eloquent acoplado) en favor de un enfoque de **Puertos y Adaptadores**. 

### 2.1 Regla Fundamental

> **La dirección de las dependencias siempre apunta hacia el dominio.**  
> El dominio NUNCA importa clases de infraestructura, frameworks, ni adaptadores (como ORM, APIs HTTP, o envío de emails directo).

### 2.2 Desglose de Capas

1. **Domain (Dominio):**
    - Contiene Modelos puros/POJOs, que abstraen la identidad `Entities` e inmutables `ValueObjects`.
    - Define interfaces lógicas abstractas (`Ports`) clasificadas en entradas `In/` y salidas `Out/` (ej., `UserRepositoryPort`).
2. **Application (Orquestación general):**
    - Se responsabiliza de implementar los `UseCases` (como `CreateUserUseCase`), gestionando la autorización del input mediante `DTO` (Objetos de Transición).
    - Mapean el Puerto Lógico contra la Entidad pura.
3. **Infrastructure (La Frontera Saliente):**
    - Proporcionan implementaciones funcionales concretas a los `Out Ports`.
    - Aquí es donde interactúa PDO, MariaDB, librerías Symfony Cache / Mailer. 
    - Fomenta el uso del patrón Repositorio (Ej: `MysqlUserRepository`, encapsulando DB).
4. **API / Presentation (Adaptadores Entrantes):**
    - Exclusivamente para recibir JSON Payloads, manejar controladores HTTP ligeros (`ResourceController` orientados a APIs) devolviendo un código 4XX o delegando en el `UseCase` pertinente para resolver 200/201.

## 3. Beneficios Tácticos

1. **Alta Testabilidad:** Ahora es posible hacer mocks y pruebas unitarias rápidas de los Casos de Uso del negocio sin dependencia real de la DB de Dolibarr, simplemente usando un Repositorio En-Memoria.
2. **Independencia Tecnológica:** Se ha extraído toda dependencia *Hardcoded* al framework (`Alxarafe`) permitiendo actualizar el core libremente.
3. **Modelo Modular (Strangler Fig):** Implementamos un esquema físico dividido en `Plugins`. El legado vive asilado (`plugins/dolibarr-compat`), permitiendo reescribir progresivamente entidades monolíticas mientras enmascaran el flujo interno hasta quedar completamente abstractas en módulos discretos (ej., `CRM`, `Trading`).

Encontrarás guías profundas de estos módulos autónomos y librerías externas en **[Arquitectura de Plugins Modulares](PLUGINS_ARCHITECTURE.md)** y la **[Guía de Referencia API](API_REFERENCE.md)**.
