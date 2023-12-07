import pandas as pd

def process_csv(file_path, updatefilepath):
    # Read the csv file
    df = pd.read_csv(file_path)

    # Convert power_voltage from mV to V
    df['power_voltage_in_volts'] = df['power_voltage'] / 1000.0
    
    # Convert power_current from mA to A
    df['power_current_in_amps'] = df['power_current'] / 1000.0
    
    # Calculate Total_power as the product of power_voltage_in_volts and power_current_in_amps
    df['Total_power'] = df['power_voltage_in_volts'] * df['power_current_in_amps']

    # Round the 'Total_power' values 
    df['TP_round'] = df['Total_power'].round(decimals = 2)
    
    # Calculate time between each record in seconds
    total_records = len(df)
    total_time_minutes = 30
    time_between_records_seconds = total_time_minutes * 60 / total_records

    # Calculate energy consumption (EC) for each record
    df['EC'] = (df['Total_power'] * time_between_records_seconds).round(decimals=2)

    # Save the modified dataframe back to the csv file
    df.to_csv(updatefilepath, index=False)

if __name__ == '__main__':
    file_path = input("Enter the path of the csv file: ")
    updatefilepath = input("Enter new path to save processed file:")
    process_csv(file_path, updatefilepath)
    print("File processed successfully!")
