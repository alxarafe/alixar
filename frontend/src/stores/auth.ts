import { defineStore } from 'pinia'
import { ref, computed } from 'vue'

interface User {
  id: number
  username: string
  email: string
  full_name: string
  roles: number[]
}

export const useAuthStore = defineStore('auth', () => {
  const token = ref<string | null>(localStorage.getItem('alixar_token'))
  const user = ref<User | null>(null)

  const isAuthenticated = computed(() => !!token.value)
  const isSuperadmin = computed(() => user.value?.roles.includes(1) ?? false)

  function login(newToken: string, userData: User) {
    token.value = newToken
    user.value = userData
    localStorage.setItem('alixar_token', newToken)
  }

  function logout() {
    token.value = null
    user.value = null
    localStorage.removeItem('alixar_token')
  }

  return {
    token,
    user,
    isAuthenticated,
    isSuperadmin,
    login,
    logout
  }
})
