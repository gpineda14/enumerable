require './enumerable'

describe Enumerable do

  let(:array) {[1, 2, 3, 4, 5]}
  let(:empty) {[]}

  describe "#my_each" do

    context "without block" do
      it "return enumerator object when no block is passed" do
        expect(array.my_each).to be_instance_of Enumerator
      end
    end

    context "with block" do
      it "return array" do
        expect(array.my_each { |x| empty << x }).to eql(array)
      end
    end

  end

  describe "#my_count" do
    it "should return the number of values in array" do
      expect(array.my_count).to eql(5)
      expect([].my_count).to eql(0)
    end

    describe "#my_any?" do

      context "without block" do
        it "should return enumerator object when no block is passed" do
          expect(array.my_any?).to be_instance_of Enumerator
        end
      end

      context "with block" do
        it "should return true if any values match condition" do
          expect(array.my_any? { |val| val < 5 }).to eql(true)
          expect(array.my_any? { |val| val > 6 }).to eql(false)
        end
      end

    end

    describe "#my_inject" do
      context "without block" do
        it "should return enumerator object when no block is passed" do
          expect(array.my_inject).to be_instance_of Enumerator
        end
      end

      context "with block" do
        it "should return sum of values in array" do
          expect(array.my_inject { |sum, number| sum + number }).to eql(15)
        end
      end
    end

  end
end
