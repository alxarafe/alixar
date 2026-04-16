import os
import re

def parse_bru_file(filepath):
    with open(filepath, 'r', encoding='utf-8') as f:
        content = f.read()
    
    # Extract method and URL
    # Format: 
    # post {
    #   url: {{baseUrl}}{{apiBase}}/invoices
    #   ...
    # }
    match = re.search(r'(\w+)\s*{\s*url:\s*(.+)', content)
    if not match:
        return None
    
    method = match.group(1).upper()
    url = match.group(2).strip()
    
    # Clean URL (remove variables)
    url = url.replace('{{baseUrl}}{{apiBase}}', '')
    url = url.replace('{{baseUrl}}', '')
    url = url.replace('{{apiBase}}', '')
    
    # Extract name from meta
    name_match = re.search(r'name:\s*(.+)', content)
    name = name_match.group(1).strip() if name_match else "Unknown"
    
    return {
        'method': method,
        'url': url,
        'name': name
    }

def main():
    api_dir = 'api'
    routes = []
    
    if not os.path.exists(api_dir):
        print(f"Error: Directory {api_dir} not found.")
        return

    for root, dirs, files in os.walk(api_dir):
        for file in files:
            if file.endswith('.bru') and file != 'folder.bru':
                filepath = os.path.join(root, file)
                route = parse_bru_file(filepath)
                if route:
                    routes.append(route)
    
    # Sort routes by URL then method
    routes.sort(key=lambda x: (x['url'], x['method']))
    
    print(f"{'METHOD':<8} | {'URL':<40} | {'NAME'}")
    print("-" * 80)
    for r in routes:
        print(f"{r['method']:<8} | {r['url']:<40} | {r['name']}")

if __name__ == "__main__":
    main()
