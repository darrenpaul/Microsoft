import gspread
import re
from oauth2client.service_account import ServiceAccountCredentials
import os
import socket
import time

# use creds to create a client to interact with the Google Drive API
scope = ['https://spreadsheets.google.com/feeds']
creds = ServiceAccountCredentials.from_json_keyfile_name('client_secret.json', scope)
client = gspread.authorize(creds)
 
# Find a workbook by name and open the first sheet
# Make sure you use the right name here.
sheet = client.open("Sunrise Windows PC").sheet1
 
# Extract and print all of the values
list_of_hashes = sheet.get_all_records()
#print(list_of_hashes)


def Use_Information():
    new_pc_name = sheet.cell(row_index,1).value
    get_date = time.strftime("%Y-%m-%d %H:%M")
    if(sheet.cell(row_index, 4).value == ""):
        sheet.update_cell(row_index, 4, get_date)
        sheet.update_cell(row_index, 5, get_date)
    else:
        get_new_deploy = sheet.cell(row_index, 5).value
        sheet.update_cell(row_index, 4, get_new_deploy)
        sheet.update_cell(row_index, 5, get_date)

    file = open("C:\deploy_temp\hostname_log.txt","w") 
    file.write(new_pc_name) 
    file.close() 


def Create_New_Information():
    last_pc_index = re.findall(r"\d+", last_pc)
    last_pc_index = int(last_pc_index[0]) + 1
    new_pc_name = "sun-win-" + str(last_pc_index)
    get_date = time.strftime("%Y-%m-%d %H:%M")

    new_pc_ip = socket.gethostbyname(socket.gethostname())

    sheet.update_cell(row_index, 1, new_pc_name)
    sheet.update_cell(row_index, 2, new_pc_ip)
    sheet.update_cell(row_index, 3, '10.0.0.1')
    sheet.update_cell(row_index, 4, get_date)
    sheet.update_cell(row_index, 5, get_date)

    file = open("C:\deploy_temp\hostname_log.txt","w") 
    file.write(new_pc_name) 
    file.close() 

pc_names = sheet.col_values(1)
last_pc = ""

row_index = 0
for pc in pc_names:
    if pc != '':
        row_index += 1
        last_pc = pc
    else:
        break

curHostname = socket.gethostname()
pc_ip = socket.gethostbyname(socket.gethostname())
ip_addresses = sheet.col_values(2)
row_index = 1
for ip in ip_addresses:
    if ip == pc_ip:
        Use_Information()
        break
    if ip == '':
        Create_New_Information()
        break;
    row_index += 1



#print "The PC is {0} adf {1} asdas {0}".format(new_pc, new_pc2)