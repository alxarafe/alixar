import re
import os

# Configuration
SQL_FILE = '/home/rafaelsj/Desarrollo/Alxarafe/alixar/doc/dolibarr.sql'
MODELS_DIR = '/home/rafaelsj/Desarrollo/Alxarafe/alixar/Modules/Alixar/Model'
MIGRATIONS_DIR = '/home/rafaelsj/Desarrollo/Alxarafe/alixar/Modules/Alixar/Migrations'

# Translation Dictionary
TRANSLATIONS = {
    'societe': 'ThirdParty',
    'socpeople': 'Contact',
    'product': 'Product',
    'facture': 'Invoice',
    'facturedet': 'InvoiceDetail',
    'commande': 'Order',
    'commandedet': 'OrderDetail',
    'propal': 'Proposal',
    'propaldet': 'ProposalDetail',
    'projet': 'Project',
    'projet_task': 'ProjectTask',
    'expedition': 'Shipment',
    'expeditiondet': 'ShipmentDetail',
    'entrepot': 'Warehouse',
    'stock_mouvement': 'StockMovement',
    'adherent': 'Member',
    'user': 'User',
    'usergroup': 'UserGroup',
    'bank': 'BankAccount',
    'actioncomm': 'AgendaEvent',
    'chargesociales': 'SocialContribution',
    'contrat': 'Contract',
    'contratdet': 'ContractDetail',
    'don': 'Donation',
    'paiement': 'Payment',
    'prelevement': 'DirectDebit',
    'reception': 'Reception',
    'receptiondet': 'ReceptionDetail',
    'shipping': 'Shipping',
    'shippingdet': 'ShippingDetail',
    'holiday': 'Holiday',
    'expense_report': 'ExpenseReport',
    'supplier_proposal': 'SupplierProposal',
    'supplier_proposaldet': 'SupplierProposalDetail',
    'fichinter': 'Intervention',
    'fichinterdet': 'InterventionDetail',
}

def to_camel_case(text):
    text = text.replace('llx_', '')
    # Check translations
    for fr, en in TRANSLATIONS.items():
        if text == fr:
            return en
        if text.startswith(fr + '_'):
            return en + text[len(fr):].title().replace('_', '')
            
    return ''.join(word.title() for word in text.split('_'))

def map_type(sql_type):
    sql_type = sql_type.lower()
    if 'int' in sql_type:
        return 'integer', None
    if 'varchar' in sql_type:
        length = re.search(r'\((\d+)\)', sql_type)
        return "string", length.group(1) if length else "255"
    if 'text' in sql_type or 'blob' in sql_type:
        return 'text', None
    if 'datetime' in sql_type or 'timestamp' in sql_type:
        return 'dateTime', None
    if 'date' in sql_type:
        return 'date', None
    if 'double' in sql_type or 'decimal' in sql_type or 'float' in sql_type:
        res = re.search(r'\((\d+),(\d+)\)', sql_type)
        if res:
            return "decimal", f"'{res.group(1)}', {res.group(2)}"
        return 'decimal', None
    if 'tinyint(1)' in sql_type or 'bool' in sql_type:
        return 'boolean', None
    return 'string', None

def parse_sql(sql_content):
    # Regex to find CREATE TABLE blocks
    table_regex = re.compile(r'CREATE TABLE `(llx_[a-z0-9_]+)` \(\n(.*?)\n\) ENGINE=', re.DOTALL | re.IGNORECASE)
    column_regex = re.compile(r'^\s*`([a-z0-9_]+)`\s+([^,]+)(?:,|$)', re.MULTILINE | re.IGNORECASE)
    
    tables = {}
    for match in table_regex.finditer(sql_content):
        full_table_name = match.group(1)
        short_table_name = full_table_name.replace('llx_', '')
        cols_block = match.group(2)
        
        columns = []
        for col_match in column_regex.finditer(cols_block):
            col_name = col_match.group(1)
            col_type = col_match.group(2)
            
            # Simple parsing for nullable and default
            is_nullable = 'NOT NULL' not in col_type.upper()
            default_val = None
            default_match = re.search(r'DEFAULT\s+([^ ]+)', col_type, re.IGNORECASE)
            if default_match:
                default_val = default_match.group(1).strip()
                if default_val.endswith(','): default_val = default_val[:-1]
            
            columns.append({
                'name': col_name,
                'type': col_type,
                'primary': 'PRIMARY KEY' in col_type.upper() or col_name == 'rowid',
                'nullable': is_nullable,
                'default': default_val
            })
            
        tables[short_table_name] = columns
        
    return tables

def generate_model(table_name, columns):
    class_name = to_camel_case(table_name)
    fillable = [col['name'] for col in columns if col['name'] not in ['rowid', 'tms']]
    
    primary_key = 'rowid' if any(c['name'] == 'rowid' for c in columns) else 'id'
    
    code = f"""<?php

namespace Modules\\Alixar\Model;

use Alxarafe\\Base\Model\Model;

/**
 * Class {class_name}
 * Represents table {table_name}
 */
class {class_name} extends Model
{{
    protected $table = '{table_name}';
    protected $primaryKey = '{primary_key}';
    public $timestamps = false;

    protected $fillable = [
"""
    for f in fillable:
        code += f"        '{f}',\n"
        
    code += """    ];
}
"""
    return class_name, code

def generate_migration(table_name, columns):
    class_name = to_camel_case(table_name)
    timestamp = "20260218100000" 
    
    blueprint_cols = []
    for col in columns:
        if col['name'] == 'rowid' or (col['name'] == 'id' and 'auto_increment' in col['type'].lower()):
            blueprint_cols.append("            $table->id();")
            continue
            
        mtype, arg = map_type(col['type'])
        if arg:
            line = f"            $table->{mtype}('{col['name']}', {arg})"
        else:
            line = f"            $table->{mtype}('{col['name']}')"
            
        if col['nullable']:
            line += "->nullable()"
            
        if col['default'] and col['default'].lower() != 'null':
            dv = col['default']
            if dv.lower() == 'current_timestamp()':
                line += "->useCurrent()"
            else:
                line += f"->default({dv})"
        line += ";"
        blueprint_cols.append(line)
        
    cols_str = "\n".join(blueprint_cols)
    
    code = f"""<?php

use Illuminate\\Database\\Capsule\\Manager as Capsule;
use Illuminate\\Database\\Migrations\\Migration;
use Illuminate\\Database\\Schema\\Blueprint;

return new class extends Migration {{
    public function up(): void
    {{
        Capsule::schema()->create('{table_name}', function (Blueprint $table) {{
{cols_str}
        }});
    }}

    public function down(): void
    {{
        Capsule::schema()->dropIfExists('{table_name}');
    }}
}};
"""
    return f"{timestamp}_{table_name}", code

def main():
    if not os.path.exists(MODELS_DIR):
        os.makedirs(MODELS_DIR)
    if not os.path.exists(MIGRATIONS_DIR):
        os.makedirs(MIGRATIONS_DIR)
        
    with open(SQL_FILE, 'r') as f:
        content = f.read()
        
    tables = parse_sql(content)
    print(f"Found {len(tables)} tables.")
    
    count = 0
    for table_name, columns in tables.items():
        # Generate Model
        name, model_code = generate_model(table_name, columns)
        with open(os.path.join(MODELS_DIR, f"{name}.php"), 'w') as f:
            f.write(model_code)
            
        # Generate Migration
        mig_name, mig_code = generate_migration(table_name, columns)
        # Using a sequence for migration names to ensure they stay in order
        sequence = str(count).zfill(6)
        with open(os.path.join(MIGRATIONS_DIR, f"20260218_{sequence}_{table_name}.php"), 'w') as f:
            f.write(mig_code)
            
        count += 1
        if count % 50 == 0:
            print(f"Generated {count} entities...")

    print(f"Done! Generated {count} models and {count} migrations.")

if __name__ == '__main__':
    main()
