# Arquitectura de Plugins Modulares (Strangler Fig)

Dentro de nuestro ecosistema Alixar, la división del Código Legado del Nuevo Core Hexagonal se rige activamente bajo el patrón **Arquitectura Modular Orientada a Plugins**. 

## Entendiendo el "Strangler Fig Pattern"

Al enfrentarse al legado enmarañado de dependencias de Dolibarr, se adoptó el estándar de ir envolviéndolo o aislandolo ("Estrangulación"). Por ello, el código legacy se confinó en un compartimento dedicado (`dolibarr-compat`), en lugar de manchar la pureza hexagonal del núcleo PHP.

> **Objetivo:** Desacoplar la lógica de dominio en Plugins (Vertical Slices), permitiendo que piezas como `Trading`, `Productos` o `Finance` operen de forma estanca y sin "hard dependencies" transversales.

## Composición de Directorios Estructurales

Toda modularización asume la carpeta `/plugins` en la raíz (Abandonando definitivamente de paso el namespace genérico `/App` antiguo):

```
alixar/
└── plugins/
    ├── core/                # Módulo Global de Base
    ├── crm/                 # Agregados y Dominio de Categorías, Terceros, Operadores.
    ├── trading/             # Entidades de Comercial (Presupuestos, Facturación)
    ├── finance/             # Impuestos, Asientos Contables, RRHH
    │
    └── dolibarr-compat/     # Refugio Blindado:
                             # Encapsula las adaptaciones temporales de compatibilidad 
                             # y dependencias directas con Dolibarr (Clases Wrapper 
                             # para PDO, Lecturas Constantes llx_).
```

### PSR-4 y Autoloading

Debido a que hemos transicionado de las macros antiguas a Plugins discretos, el Autoloader ha sido ajustado expresamente en el `composer.json` primario:

```json
"autoload": {
    "psr-4": {
        "Alixar\\Core\\": "src/Core/",
        "Plugin\\Crm\\": "plugins/crm/src/",
        "Plugin\\Trading\\": "plugins/trading/src/",
        "Plugin\\Finance\\": "plugins/finance/src/",
        "Plugin\\DolibarrCompat\\": "plugins/dolibarr-compat/src/"
    }
}
```

Cada plugin contiene ahora en su núcleo interno (`src/`) su partición **Domain**, **Infrastructure** y **Application**.

## Ciclo de Transición Completa

Al migrar un antiguo controlador heredado de `/App\Controllers`:
1. El Agregado u Entidad se modela bajo `Plugin\{Nombre}\Domain\`.
2. Las peculiaridades de comunicación que fuerzan consultas MySQL directas se aíslan como infraestructura específica o, si son puramente dolibarrescas insalvables, en `Plugin\DolibarrCompat`.
3. Esto garantiza que la comprobación estricta de PHPStan valide una desconexión 100% de la persistencia sucia antes de ser marcada como Refactorizado.
