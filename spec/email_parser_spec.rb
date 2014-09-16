describe "EmailParser" do
  describe '#parser' do
    it "parses CSV emails" do
      emails = "avi@test.com, arel@test.com"
      expect(EmailParser.new(emails).parse).to eq(["avi@test.com", "arel@test.com"])
    end

    it "parses space delimited emails" do
      emails = "avi@test.com arel@test.com"

      expect(EmailParser.new(emails).parse).to eq(["avi@test.com", "arel@test.com"])
    end

    it "parses both CSV and spac delimited emails" do
      emails = "avi@test.com, arel@test.com test@avi.com, test@arel.com"

      expect(EmailParser.new(emails).parse).to eq(["avi@test.com", "arel@test.com","test@avi.com", "test@arel.com"]) 
    end

    it 'parses and removes duplicate emails' do
      emails = "avi@test.com, avi@test.com"

      expect(EmailParser.new(emails).parse).to eq(["avi@test.com"])
    end
  end
end
