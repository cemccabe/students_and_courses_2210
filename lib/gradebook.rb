require './lib/student'
require './lib/course'

class Gradebook
  attr_reader :instructor, :courses

  def initialize(instructor)
    @instructor = instructor
    @courses = []
  end

  def add_course(course)
    @courses << course
  end

  def list_all_students
    arr = []
    @courses.each do |course|
      arr << course.students
    end
    arr.flatten
  end

  def low_grade_threshold(threshold)
    list_all_students.find_all do |student|
      student.grade < threshold
    end
  end
end