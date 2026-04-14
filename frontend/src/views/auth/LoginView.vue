<script setup lang="ts">
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useAuthStore } from '../../stores/auth'

import { api } from '../../api'

const username = ref('')
const password = ref('')
const error = ref('')
const isLoading = ref(false)

const router = useRouter()
const authStore = useAuthStore()

const handleLogin = async () => {
  error.value = ''
  isLoading.value = true
  try {
    if (username.value && password.value) {
      const isEmail = username.value.includes('@')
      const credentials = {
        [isEmail ? 'email' : 'username']: username.value,
        password: password.value
      }
      
      const response = await api.login(credentials)
      
      authStore.login(response.token, response.user)
      router.push('/')
    } else {
      error.value = 'Por favor, introduzca credenciales.'
      isLoading.value = false
    }
  } catch (err: any) {
    error.value = err.message || 'Credenciales inválidas o error de conexión.'
    isLoading.value = false
  }
}
</script>

<template>
  <div class="login-container">
    <div class="animated-background"></div>
    <div class="glass-panel login-box">
      <div class="logo">
        <h2>Alixar</h2>
        <span>Headless Access</span>
      </div>
      
      <form @submit.prevent="handleLogin" class="login-form">
        <div v-if="error" class="error-alert">{{ error }}</div>
        
        <div class="input-group">
          <label for="username">Usuario / Email</label>
          <input 
            id="username" 
            v-model="username" 
            type="text" 
            placeholder="admin"
            autocomplete="username"
            required
          />
        </div>

        <div class="input-group">
          <label for="password">Contraseña</label>
          <input 
            id="password" 
            v-model="password" 
            type="password" 
            placeholder="••••••••"
            autocomplete="current-password"
            required
          />
        </div>

        <button type="submit" class="btn-primary" :disabled="isLoading">
          <span v-if="isLoading" class="spinner"></span>
          <span v-else>Acceder al Sistema</span>
        </button>
      </form>
    </div>
  </div>
</template>

<style scoped>
.login-container {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  width: 100vw;
  position: fixed;
  top: 0;
  left: 0;
  background: var(--bg-body, #0f172a);
  z-index: 1000; /* Asegurarse de que cubra la app */
}

.animated-background {
  position: absolute;
  width: 150vw;
  height: 150vh;
  background: radial-gradient(circle at 50% 50%, rgba(139, 92, 246, 0.15) 0%, rgba(15, 23, 42, 0) 50%),
              radial-gradient(circle at 80% 20%, rgba(59, 130, 246, 0.15) 0%, rgba(15, 23, 42, 0) 40%);
  animation: pulse 15s ease-in-out infinite alternate;
  z-index: 0;
}

@keyframes pulse {
  0% { transform: scale(1) translate(0, 0); }
  100% { transform: scale(1.1) translate(-2%, 2%); }
}

.login-box {
  width: 100%;
  max-width: 420px;
  padding: 3rem 2.5rem;
  z-index: 1;
  display: flex;
  flex-direction: column;
  gap: 2rem;
  box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
  border: 1px solid rgba(255, 255, 255, 0.1);
  background: rgba(30, 41, 59, 0.7);
  backdrop-filter: blur(20px);
  border-radius: 20px;
  animation: slideUp 0.6s cubic-bezier(0.16, 1, 0.3, 1);
}

@keyframes slideUp {
  0% { opacity: 0; transform: translateY(30px); }
  100% { opacity: 1; transform: translateY(0); }
}

.logo {
  text-align: center;
}
.logo h2 {
  font-size: 2.5rem;
  font-weight: 800;
  margin: 0 0 0.5rem 0;
  background: linear-gradient(135deg, #a855f7, #3b82f6);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
}
.logo span {
  font-size: 0.9rem;
  color: var(--text-muted, #94a3b8);
  letter-spacing: 0.15em;
  text-transform: uppercase;
}

.login-form {
  display: flex;
  flex-direction: column;
  gap: 1.5rem;
}

.error-alert {
  padding: 1rem;
  background: rgba(239, 68, 68, 0.1);
  border: 1px solid rgba(239, 68, 68, 0.2);
  color: #fca5a5;
  border-radius: 8px;
  font-size: 0.875rem;
  text-align: center;
  animation: shake 0.4s ease-in-out;
}

@keyframes shake {
  0%, 100% { transform: translateX(0); }
  25% { transform: translateX(-5px); }
  75% { transform: translateX(5px); }
}

.input-group label {
  display: block;
  font-size: 0.875rem;
  color: var(--text-muted, #cbd5e1);
  margin-bottom: 0.5rem;
  font-weight: 500;
}

.input-group input {
  width: 100%;
  box-sizing: border-box;
  background: rgba(15, 23, 42, 0.6);
  border: 1px solid rgba(255, 255, 255, 0.1);
  color: #f8fafc;
  padding: 0.875rem 1rem;
  border-radius: 10px;
  font-size: 1rem;
  transition: all 0.3s ease;
  outline: none;
}

.input-group input:focus {
  border-color: #a855f7;
  box-shadow: 0 0 0 2px rgba(168, 85, 247, 0.2);
  background: rgba(15, 23, 42, 0.8);
}

.btn-primary {
  margin-top: 0.5rem;
  width: 100%;
  padding: 1rem;
  border-radius: 10px;
  background: linear-gradient(135deg, #a855f7 0%, #3b82f6 100%);
  border: none;
  color: white;
  font-size: 1rem;
  font-weight: 600;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  overflow: hidden;
  display: flex;
  justify-content: center;
  align-items: center;
}

.btn-primary:hover:not(:disabled) {
  transform: translateY(-2px);
  box-shadow: 0 10px 20px -10px rgba(168, 85, 247, 0.5);
}

.btn-primary:active:not(:disabled) {
  transform: translateY(0);
}

.btn-primary:disabled {
  opacity: 0.7;
  cursor: not-allowed;
}

.spinner {
  width: 20px;
  height: 20px;
  border: 2px solid rgba(255, 255, 255, 0.3);
  border-radius: 50%;
  border-top-color: #fff;
  animation: spin 0.8s linear infinite;
}

@keyframes spin {
  to { transform: rotate(360deg); }
}
</style>
