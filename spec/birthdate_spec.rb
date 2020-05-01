require 'birthdate'

 describe Birthdate do
   let(:subject) { described_class.new("1990-04-30T23:59:60Z", today) }
   let(:today) { Date.parse("2020-04-29")}


   describe "#date" do
     it "returns birthday" do
     expect(subject.date).to eq Date.parse("1990-04-30T23:59:60Z")
    end
  end

  describe "#calculate_days" do
    it "returns days till next birthday" do
      allow(Date).to receive(:today).and_return Date.new(2020,4,29)
      subject.date
      subject.date
      subject.calculate_days
      expect(subject.calculate_days).to eq 1
    end
  end

  describe "#birthday?" do
    it "compares today to birthday and returns true or false" do
      allow(Date).to receive(:today).and_return Date.new(2020,4,29)
      subject.date
      expect(subject.birthday?).to eq false
    end
  end
 end
