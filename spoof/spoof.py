import winreg as reg
import os

# Define the registry path and value names
reg_path = r"HARDWARE\DESCRIPTION\System\BIOS"
manufacturer_value_name = "SystemManufacturer"
product_name_value_name = "SystemProductName"

# Define the new values
new_manufacturer = "Samsung"
new_product_name = "NP960XFG-KC4UK"

# Get the current user's desktop path
desktop_path = os.path.join(os.path.join(os.environ['USERPROFILE']), 'Desktop')
backup_file_path = os.path.join(desktop_path, "RegistryBackup.txt")

# Open the registry key
key = reg.OpenKey(reg.HKEY_LOCAL_MACHINE, reg_path, 0, reg.KEY_READ | reg.KEY_WRITE)

# Read the current values
original_manufacturer, reg_type = reg.QueryValueEx(key, manufacturer_value_name)
original_product_name, reg_type = reg.QueryValueEx(key, product_name_value_name)

# Create a backup file and write the original values
with open(backup_file_path, "w") as backup_file:
    backup_file.write(f"Original {manufacturer_value_name}: {original_manufacturer}\n")
    backup_file.write(f"Original {product_name_value_name}: {original_product_name}\n")

# Set the new values
reg.SetValueEx(key, manufacturer_value_name, 0, reg.REG_SZ, new_manufacturer)
reg.SetValueEx(key, product_name_value_name, 0, reg.REG_SZ, new_product_name)

# Close the registry key
reg.CloseKey(key)

print(f"Registry values updated and backup created at {backup_file_path}")

