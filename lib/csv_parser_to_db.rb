require 'csv'
require 'sqlite3'
require 'date'
require 'byebug'

# Reading the CSV file
companies = CSV.read("TechCrunchcontinentalUSA.csv")

# YOUR CODE GOES HERE


dB = {}

companies.drop(1).each do |company|

  name = company[1]
  category = company[3]
  fundedDate = Date.parse(company[6])
  raisedAmt = company[7]

  if category == "web"

    if dB[name]
      current_dB_date = dB[name]["fundedDate"]
      
      if Date.parse(current_dB_date) < fundedDate
        dB[name]["numEmps"] = company[2]
        dB[name]["city"] = company[4]
        dB[name]["state"] = company[5]
        dB[name]["fundedDate"] = company[6]
        dB[name]["raisedAmt"] = company[7]
        dB[name]["round"] = company[9]
        
      elsif Date.parse(current_dB_date) == fundedDate
        curr_dB_amount = dB[name]["raisedAmt"] 
        
        if curr_dB_amount < raisedAmt
          dB[name]["raisedAmt"] = company[7]
        end 
      end

    else
      dB[name] = { 
        "permalink" => company[0],
        "company" => company[1],
        "numEmps" => company[2],
        "category" => company[3],
        "city" => company[4],
        "state" => company[5],
        "fundedDate" => company[6],
        "raisedAmt" => company[7],
        "raisedCurrency" => company[8],
        "round" => company[9]
      }
    end 
  end

end

begin

  db = SQLite3::Database.open "companies.db"
  db.execute "DROP TABLE IF EXISTS Companies"
  db.execute "CREATE TABLE IF NOT EXISTS Companies(Id INTEGER PRIMARY KEY,
      Permalink TEXT, Company TEXT, NumEmps INT, Category TEXT, City TEXT, State TEXT, FundedDate TEXT,
      RaisedAmt INT, RaisedCurrency TEXT, Round TEXT)"

  # YOUR CODE GOES HERE
  id = 1
  dB.each do |_, company| 
    db.execute("INSERT INTO Companies VALUES(
      ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", id, 
      company["permalink"], 
      company["company"],
      company["numEmps"],
      company["category"],
      company["city"],
      company["state"],
      company["fundedDate"],
      company["raisedAmt"],
      company["raisedCurrency"],
      company["round"] )
    id += 1
  end

rescue SQLite3::Exception => e

  puts "Exception occurred"
  puts e

ensure
  db.close if db
end


# BONUS: YOUR CODE GOES HERE
begin
  db = SQLite3::Database.open "companies.db"
  db.execute "DROP TABLE IF EXISTS AllCompanies"
  db.execute "CREATE TABLE IF NOT EXISTS AllCompanies(Id INTEGER PRIMARY KEY,
      Permalink TEXT, Company TEXT, NumEmps INT, Category TEXT, City TEXT, State TEXT, FundedDate TEXT,
      RaisedAmt INT, RaisedCurrency TEXT, Round TEXT)"
  id = 1
  companies.drop(1).each do |company| 
    db.execute("INSERT INTO AllCompanies VALUES(
      ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)", id, company)
    id += 1
  end
rescue SQLite3::Exception => e

  puts "Exception occurred"
  puts e

ensure
  db.close if db
end 

# BONUS  

# SELECT AllCompanies.Company as Name, AVG(AllCompanies.RaisedAmt) as AverageAmt, Companies.RaisedAmt, Companies.RaisedAmt - AVG(AllCompanies.RaisedAmt) as DIFF
#     FROM AllCompanies
#     JOIN Companies ON (Companies.Company = AllCompanies.Company)
#     GROUP BY AllCompanies.Company 
#     ORDER BY DIFF DESC
#     LIMIT 1;