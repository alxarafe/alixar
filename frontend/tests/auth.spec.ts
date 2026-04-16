import { describe, it, expect, beforeEach, vi } from 'vitest'
import { setActivePinia, createPinia } from 'pinia'
import { useAuthStore } from '../src/stores/auth'

describe('Auth Store', () => {
  beforeEach(() => {
    setActivePinia(createPinia())
    // Cleanup localStorage
    localStorage.clear()
  })

  it('starts unauthenticated when no token in localStorage', () => {
    const auth = useAuthStore()
    expect(auth.isAuthenticated).toBe(false)
    expect(auth.token).toBeNull()
  })

  it('can login, set token and emit state changes', () => {
    const auth = useAuthStore()
    
    auth.login('dummy-jwt-token', {
      id: 1,
      username: 'admin',
      email: 'admin@alixar.local',
      full_name: 'System Admin',
      roles: [1]
    })

    expect(auth.isAuthenticated).toBe(true)
    expect(auth.isSuperadmin).toBe(true)
    expect(auth.token).toBe('dummy-jwt-token')
    expect(localStorage.getItem('alixar_token')).toBe('dummy-jwt-token')
  })

  it('can logout and clear state', () => {
    const auth = useAuthStore()
    
    // login first
    auth.login('dummy-jwt-token', {
      id: 1,
      username: 'admin',
      email: 'admin@alixar.local',
      full_name: 'System Admin',
      roles: []
    })

    expect(auth.isAuthenticated).toBe(true)

    // logout
    auth.logout()

    expect(auth.isAuthenticated).toBe(false)
    expect(auth.token).toBeNull()
    expect(localStorage.getItem('alixar_token')).toBeNull()
  })
})
