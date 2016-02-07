require_relative 'caeser_cipher.rb'

describe "#caeser_cipher" do
  before do
    @sentence = 'hello world'
    @word = 'word'
    @char = 'a'
  end
	describe "no numshift" do
		context "empty string" do
			subject {caeser_cipher('',0)}
			it { is_expected.to  eq('') }
    end
    context 'one @word' do
      subject {caeser_cipher(@word,0)}
      it {is_expected.to eq(@word)}
    end
    context 'one setence' do
      subject {caeser_cipher(@sentence,0)}
      it {is_expected.to eq(@sentence)}
    end
    context 'with @char' do
      subject {caeser_cipher(@char,0)}
      it {is_expected.to eq(@char)}
    end
  end

  describe "5 num shift" do
    context "with @word" do
      subject {caeser_cipher(@word,5)}
      it {is_expected.to eq('btwi')}
    end

    context "with @sentence" do
      subject {caeser_cipher(@sentence,5)}
      it {is_expected.to eq('mjqqt btwqi')}
    end

    context "with @char" do
      subject {caeser_cipher(@char,5)}
      it {is_expected.to eq('f')}
    end
  end
end