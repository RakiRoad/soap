require "csv"

contents = Array.new
#this just reads each line. Remember that columns are 0-indexed
CSV.foreach("TRI_2014_NJ.csv", {:force_quotes => true, :headers => true}) do |row|
#Each entry is an array
	entry = Array.new
	
	facility_id = row[1]
	facility_name = row[2]
	street_address = row[3]
	municipality = row[4]
	county = row[5]
	latitude = row[10]
	longitude = row[11]
	chemical = row[26]
	chemical_id = row[27]
	clean_air_act = row[28]	
	
#Supporting variable. Wont be directly pushed but will be used to determine PBT
	classification = row[29]
	
	metal = row[30]	
	carcinogen = row[32]
	stack_air = row[36]
	water = row[37]
	total_releases = row[85]
	parent_company_name = row[100]
	
	danger_level = "N/A"
	brownfield = "N/A"
	
#Determines effects
	if carcinogen == "YES"
		effects = "Causes cancer"
	else
		effects = "Does not cause cancer"
	end
	
#Determines PBT status
	if classification == "PBT"
		pbt_status = "PBT"
	else
		pbt_status = "NON_PBT"
	end

#Pushes source data to an entry array	
	entry.push(facility_id, facility_name, street_address, municipality, county, latitude, 
				longitude, chemical,  clean_air_act, pbt_status, metal, carcinogen,
			   stack_air, water, total_releases, parent_company_name, effects, danger_level,
			    brownfield, chemical_id)

#Contents is the big array that is comprised of multiple entry arrays					 
	contents.push(entry)
end	

chemicals = Array.new

for i in 0..1247
	chemicals[i] = "#{contents[i][19]}" + "\t" + "#{contents[i][7]}" + "\t" + "#{contents[i][11]}" +
					"\t" + "#{contents[i][8]}" + "\t" + "#{contents[i][10]}" + "\t" +"#{contents[i][9]}" + "\n"
end

sorted_chemicals = chemicals.sort

consolidated_chemicals = Array.new

#new_tracker = Index for consolidated chemicals
new_tracker = 0

#i = Index for sorted chemicals
for i in 0..1247
	if i == 0
		consolidated_chemicals[new_tracker] = sorted_chemicals[i]
		new_tracker = new_tracker + 1 
		i = i + 1
	elsif sorted_chemicals[i] == sorted_chemicals[i-1]
		i = i + 1	
	else
		consolidated_chemicals[new_tracker] = sorted_chemicals[i]
		new_tracker = new_tracker + 1
		i = i + 1
	end
end
	

facilities = Array.new

for i in 0..1247
	facilities[i] = "#{contents[i][0]}" + "\t" +  "#{contents[i][1]}" + "\t" + 
					"#{contents[i][2]}" + "\t" + "#{contents[i][18]}" + "\n"			
end
	
locations = Array.new

for i in 0..1247
	locations[i] =  "#{contents[i][2]}" + "\t" +  "#{contents[i][4]}" + "\t" + 
					"#{contents[i][3]}" + "\t" + "#{contents[i][5]}" + "\t" + "#{contents[i][6]}" + "\n"
end
	
contains = Array.new

for i in 0..1247
	contains[i] = "#{contents[i][0]}" + "\t" +  "#{contents[i][19]}" + "\t" + 
					"#{contents[i][14]}" + " Pounds\t" + "#{contents[i][8]}" + " Pounds\t" + "#{contents[i][13]}" 
					+ " Pounds\t" + "#{contents[i][12]}" + "\n"
end

nn_data = Array.new

#Converting latitude and longitude from Excel sheet into degrees / minutes / seconds format
for i in 0..1247
	nn_data[i] = "#{contents[i][0]}" + "\t" +
					"#{contents[i][17]}" + "\t" + "#{contents[i][5]}" + "\t" + "#{contents[i][6]}" 
					+ "\n"
end
	
#owners = Array.new

# for i in 0..1247
# 	owners[i] = "INSERT INTO owners VALUES (" + "RANDOM ID" + ", " +
# 					"#{contents[i][15]}" + "\n"
# 
# end

File.new("updatesoap2.sql", "w+")
File.open("updatesoap2.sql", "w+") do |f|
	
	#chemicals input
	f.puts("--")
	f.puts("-- Data for Name: chemicals; Type: TABLE DATA; Schema: newsoap; Owner: postgres")
	f.puts("--")
	f.puts("\n")
		f.puts("DELETE FROM newsoap.chemicals;")
	f.puts("COPY newsoap.chemicals (id, chemical_name, carcinogenic, clean_air_act, metal, pbt) FROM stdin;")
	f.puts(consolidated_chemicals)
	f.puts("\\.\n\n")
	
	#locations input
	f.puts("--")
	f.puts("-- Data for Name: locations; Type: TABLE DATA; Schema: newsoap; Owner: postgres")
	f.puts("--")
	f.puts("\n")
		f.puts("DELETE FROM newsoap.locations;")
	f.puts("COPY newsoap.locations (id, county, municipality, x_coor, y_coor) FROM stdin;")	
	f.puts(locations)
	f.puts("\\.\n\n")	

	#facilities input
	f.puts("--")
	f.puts("-- Data for Name: facilities; Type: TABLE DATA; Schema: newsoap; Owner: postgres")
	f.puts("--")
	f.puts("\n")
		f.puts("DELETE FROM newsoap.facilities;")
	f.puts("COPY newsoap.facilities (id, facility_name, location_id, is_brownfield) FROM stdin;")	
	f.puts(facilities)
	f.puts("\\.\n\n")	

	#contains input
	f.puts("--")
	f.puts("-- Data for Name: contains; Type: TABLE DATA; Schema: newsoap; Owner: postgres")
	f.puts("--")
	f.puts("\n")
		f.puts("DELETE FROM newsoap.contains;")
	f.puts("COPY newsoap.contains (facility_id, chemical_id, total_amount, fugair_amount, water_amount, 
			stackair_amount) FROM stdin;")
	f.puts(contains)		
	f.puts("\\.\n\n")	
		
	#nn_data input
	f.puts("--")
	f.puts("-- Data for Name: nn_data; Type: TABLE DATA; Schema: newsoap; Owner: postgres")
	f.puts("--")
	f.puts("\n")
	f.puts("DELETE FROM newsoap.nn_data;")
	f.puts("COPY newsoap.nn_data (facility_id, dangerous_state, longitude, latitude) FROM stdin;")	
	f.puts(nn_data)
	f.puts("\\.\n\n")

	f.puts("REVOKE ALL ON SCHEMA public FROM PUBLIC;")
	f.puts("REVOKE ALL ON SCHEMA public FROM postgres;")
	f.puts("GRANT ALL ON SCHEMA public TO postgres;")
	f.puts("GRANT ALL ON SCHEMA public TO PUBLIC;")
	
end
	









 








 



