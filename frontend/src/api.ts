// frontend/src/api.ts

export const DOLAPIKEY = 'test-key-or-change-me';

// --- Interfaces ---

export interface Contact {
  id: number;
  lastname: string;
  firstname?: string;
  email?: string;
  phone_pro?: string;
  phone_mobile?: string;
  jobTitle?: string;
  town?: string;
  thirdPartyId?: number;
  [key: string]: any;
}

export interface Product {
  id: number;
  ref: string;
  label: string;
  type: string;
  price_ttc?: number;
  tva_tx?: number;
  status_buy?: string;
  description?: string;
  [key: string]: any;
}

export interface ThirdParty {
  id: number;
  name: string;
  name_alias?: string;
  email?: string;
  phone?: string;
  client: number;
  address?: string;
  zip?: string;
  town?: string;
  countryId?: number;
  siren?: string;
  url?: string;
  code_client?: string;
  code_fournisseur?: string;
  [key: string]: any;
}

export interface Project {
  id: number;
  ref: string;
  title: string;
  status: number;
  [key: string]: any;
}

export interface BankAccount {
  id: number;
  ref: string;
  label: string;
  bank: string;
  iban_prefix?: string;
  currency_code: string;
  [key: string]: any;
}

export interface CRMEvent {
  id: number;
  title: string;
  typeCode: string;
  dateStart?: string;
  dateEnd?: string;
  note?: string;
  thirdPartyId?: number;
  [key: string]: any;
}

// --- API Service ---

class ApiService {
  constructor(private baseUrl: string) {}

  async request<T>(endpoint: string, method: string = 'GET', data: any = null): Promise<T> {
    const url = `${this.baseUrl}${endpoint}`;
    const headers: Record<string, string> = {
      'Content-Type': 'application/json',
      'DOLAPIKEY': DOLAPIKEY
    };

    const config: RequestInit = {
      method,
      headers
    };

    if (data) {
      config.body = JSON.stringify(data);
    }

    try {
      const response = await fetch(url, config);
      if (!response.ok) {
        let errorMsg = `Error ${response.status}: ${response.statusText}`;
        try {
           const errData = await response.json();
           if(errData.error && errData.error.message) {
               errorMsg = errData.error.message;
           }
        } catch(e) {}
        throw new Error(errorMsg);
      }
      return await response.json() as T;
    } catch (error: any) {
      console.error(`API Error on ${method} ${endpoint}:`, error);
      throw error;
    }
  }

  // --- API Methods ---
  // --- Third Parties ---
  getThirdParties(): Promise<ThirdParty[]> {
    return this.request<ThirdParty[]>('/thirdparties');
  }
  createThirdParty(data: Partial<ThirdParty>): Promise<number> {
    return this.request<number>('/thirdparties', 'POST', data);
  }
  updateThirdParty(id: number, data: Partial<ThirdParty>): Promise<ThirdParty> {
    return this.request<ThirdParty>(`/thirdparties/${id}`, 'PUT', data);
  }

  // --- Contacts ---
  getContacts(): Promise<Contact[]> {
    return this.request<Contact[]>('/contacts');
  }
  createContact(data: Partial<Contact>): Promise<number> {
    return this.request<number>('/contacts', 'POST', data);
  }
  updateContact(id: number, data: Partial<Contact>): Promise<Contact> {
    return this.request<Contact>(`/contacts/${id}`, 'PUT', data);
  }

  // --- Products ---
  getProducts(): Promise<Product[]> {
    return this.request<Product[]>('/products');
  }
  createProduct(data: Partial<Product>): Promise<number> {
    return this.request<number>('/products', 'POST', data);
  }
  updateProduct(id: number, data: Partial<Product>): Promise<Product> {
    return this.request<Product>(`/products/${id}`, 'PUT', data);
  }

  // --- External Entities ---
  getBankAccounts(): Promise<BankAccount[]> {
    return this.request<BankAccount[]>('/bankaccounts');
  }
  getProjects(): Promise<Project[]> {
    return this.request<Project[]>('/projects');
  }
  getEvents(): Promise<CRMEvent[]> {
    return this.request<CRMEvent[]>('/events');
  }
}

// Ensure you point to your correct port! Currently assumes 8091 based on previous bash logs.
export const api = new ApiService('http://localhost:8091/api');
