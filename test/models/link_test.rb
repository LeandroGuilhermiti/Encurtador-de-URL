require "test_helper"

class LinkTest < ActiveSupport::TestCase
  test "deve gerar um código curto automaticamente ao criar" do
    link = Link.create(url_original: "https://www.google.com")
    assert_not_nil link.url_short
    assert_equal 6, link.url_short.length
  end

  test "não deve salvar link sem url original" do
    link = Link.new(url_original: nil)
    assert_not link.save
  end

  test "cada código curto deve ser único" do
    link1 = Link.create(url_original: "https://site1.com", url_short: "abc123")

    # link com o mesmo url_short
    link2 = Link.new(url_original: "https://site2.com", url_short: "abc123")

    assert_not link2.valid?, "O link não deveria ser válido com um url_short duplicado"
    assert_includes link2.errors[:url_short], "has already been taken"
  end
end