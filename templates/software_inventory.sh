id=$(curl -H "Authorization: Bearer Oracle" -L http://169.254.169.254/opc/v2/instance/id)
file_name=software-inventory-$id-"`date +"%d-%m-%Y"`".csv
rpm -qa --queryformat '%{NAME}, "%{VENDOR}", %{VERSION}, "%{LICENSE}", "%{SUMMARY}"\n' | sort > {{ temp_report_path }}/inventory.csv
oci os object put -bn {{ resource_bucket_name }} --name $file_name --file {{ temp_report_path }}/inventory.csv --force --auth instance_principal
rm {{ temp_report_path }}/inventory.csv