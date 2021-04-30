require 'sqlite3'
DB = SQLite3::Database.new("doctors.sqlite")



class Doctor
  attr_reader :id, :name, :age, :specialty
  def initialize(attributes = {})
    @id = attributes[:id] || attributes['id']
    @name = attributes[:name] || attributes['name']
    @age = attributes[:age] || attributes['age']
    @specialty = attributes[:specialty] || attributes['specialty']
  end
  # both of these work now...
  # doc = Doctor.new(name: 'simon')
  # # doc = Doctor.new('name' => 'simon')
  # doc.age

  def self.all
    DB.results_as_hash = true
    puts 'SELECTing from the DB.....'
    results = DB.execute('SELECT * FROM doctors') # array of hashes
    results.map do |attributes|
      # alternative - would be to convert the string keys into symbols
      # alternative - build it the long way
      # Doctor.new(
      #   name: attributes['name'],
      #   age: attributes['age']
      # )
      Doctor.new(attributes)
    end
  end

  # this used to be in the repository
  def save
    # both create and update
    # tell the DB to save all of the info for this instance
    # @id, @name, @age, @specialty and give it to the DB
    puts 'Inserting into DB.....'
    # DB.execute('run a query here')
    puts 'asking DB for last id'
    puts 'giving that id to the instance'
  end
end

# debugging purposes (normally in the controller)
# name = @view.ask_for('name')
# age = @view.ask_for('age')
doctor = Doctor.new(name: 'lena', age: 12)
doctor.save
p doctor


# doctors = Doctor.all
# p doctors
# p DB.last_insert_row_id

#
