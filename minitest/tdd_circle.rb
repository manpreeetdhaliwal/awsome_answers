require 'minitest/autorun'
class Circle
    attr_accessor :radius

    def initialize(radius)
        @radius=radius
        
    end
    
    def perimeter
        3.14*(2*@radius) 
    end
    def area
        3.14*(@radius**2) 
    end
    def diameter
        2*@radius
    end

end

describe Circle do
    describe '.area' do
        it 'return calculated area of the circle' do
            # Given
            c=Circle.new(2)
            #when
            area =c.area
            #then
            # _(area).must_equal(3.14)
            _(area).must_equal(12.56)
        end
    end
    describe '.perimeter'do
        it 'return the calculated perimeter of the circle' do
            #given
            c= Circle.new(2)
            #when
            perm = c.perimeter
            #Then
            # _(perm).must_equal(6.28)
            _(perm).must_equal(12.56)
        end
    end 
    describe '.diameter' do
        it "return the calculated diameter" do
            # given
            c =Circle.new(2)
            #when
            value=c.diameter
            #then
            # _(value).must_equal(2)
            _(value).must_equal(4)
        end
    end

end