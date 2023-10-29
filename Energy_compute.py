import pandas as pd

# Mapping of app names to domains
APP_TO_DOMAIN = {
    'Basketball': 'Gaming',
    'Gorilla Tag': 'Gaming',
    'Blaston': 'Gaming',
    'Innerworld': 'Education',
    'ShapesXR': 'Education',
    'Zoe': 'Education',
    'Rec room': 'Entertainment',
    'VR Animation Player': 'Entertainment',
    'Ultimechs': 'Entertainment'
}

def process_csv(file_path, run_number, app_name):
    # Read the csv file
    df = pd.read_csv(file_path)

    # Calculate mean of TP_round and then calculate Energy_consumed
    mean_tp = df['TP_round'].mean()
    energy_consumed = mean_tp * 1800

    # Fetch the domain using the app name
    domain_name = APP_TO_DOMAIN.get(app_name, "Unknown")

    # Prepare data to be appended to the new CSV
    new_data = {
        'Energy_consumed': [energy_consumed],
        'Run_no': [run_number],
        'Application_name': [app_name],
        'Domain_name': [domain_name]
    }

    new_df = pd.DataFrame(new_data)

    # Define the path to the new CSV (modify as needed)
    new_csv_path = 'D:\Green lab\ProcessedReq2.csv'

    # Check if the CSV file already exists, if not create one
    try:
        existing_df = pd.read_csv(new_csv_path)
        final_df = pd.concat([existing_df, new_df], ignore_index=True)
    except FileNotFoundError:
        final_df = new_df

    # Save the dataframe to the new CSV
    final_df.to_csv(new_csv_path, index=False)
    print("Data successfully added to output.csv!")

if __name__ == '__main__':
    file_path = input("Enter the path of the csv file: ")
    run_number = input("Enter the run number: ")

    # Prompt user to select app_name from the list of available apps
    print("\nAvailable applications:")
    for index, app in enumerate(APP_TO_DOMAIN.keys(), 1):
        print(f"{index}. {app}")
    app_choice = int(input("\nEnter the number corresponding to the application name: "))
    app_name = list(APP_TO_DOMAIN.keys())[app_choice - 1]

    process_csv(file_path, run_number, app_name)
