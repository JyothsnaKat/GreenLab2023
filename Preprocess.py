import pandas as pd

def process_csv(file_path):
    # Read the csv file
    df = pd.read_csv(file_path)

    # Convert power_voltage from mV to V
    df['power_voltage_in_volts'] = df['power_voltage'] / 1000.0
    
    # Convert power_current from mA to A
    df['power_current_in_amps'] = df['power_current'] / 1000.0
    
    # Calculate Total_power as the product of power_voltage_in_volts and power_current_in_amps
    df['Total_power'] = df['power_voltage_in_volts'] * df['power_current_in_amps']

    # Save the modified dataframe back to the csv file
    df.to_csv(file_path, index=False)

if __name__ == '__main__':
    file_path = input("Enter the path of the csv file: ")
    process_csv(file_path)
    print("File processed successfully!")
