require './lib/student'
require './lib/course'
require './lib/gradebook'

RSpec.describe Gradebook do
  it 'exists' do
    gradebook = Gradebook.new("Sanchez")

    expect(gradebook).to be_a(Gradebook)
  end

  it 'has an instructor' do
    gradebook = Gradebook.new("Sanchez")

    expect(gradebook.instructor).to eq("Sanchez")
  end

  it 'has a empty default array for courses' do
    gradebook = Gradebook.new("Sanchez")

    expect(gradebook.courses).to eq([])
  end

  it 'can add courses' do
    gradebook = Gradebook.new("Sanchez")
    
    course1 = Course.new("Calculus", 20)
    course2 = Course.new("Physics", 30)

    gradebook.add_course(course1)
    gradebook.add_course(course2)

    expect(gradebook.courses).to eq([course1, course2])
  end

  it 'can list all students in its courses' do
    gradebook = Gradebook.new("Sanchez")

    course1 = Course.new("Calculus", 20)
    course2 = Course.new("Physics", 30)

    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})

    course1.enroll(student1)
    course2.enroll(student2)

    gradebook.add_course(course1)
    gradebook.add_course(course2)

    expect(gradebook.list_all_students).to eq([student1, student2])
  end

  it 'can list all students with grades below a certain threshold' do
    gradebook = Gradebook.new("Sanchez")

    course1 = Course.new("Calculus", 20)
    course2 = Course.new("Physics", 30)

    student1 = Student.new({name: "Morgan", age: 21})
    student2 = Student.new({name: "Jordan", age: 29})

    student1.log_score(89)
    student2.log_score(78)

    course1.enroll(student1)
    course2.enroll(student2)

    gradebook.add_course(course1)
    gradebook.add_course(course2)

    expect(gradebook.low_grade_threshold(80)).to eq([student2])
  end
end