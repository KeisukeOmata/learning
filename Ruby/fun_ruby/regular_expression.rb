/Ruby/ =~ "1234Ruby9 " =>4
/Ruby/ =~ "Ruby" => 0
/Ruby/ =~ "hoge" => nil

#大文字、小文字を区別しない
/Ruby/i =~ "ruby" => 0
/Ruby/i =~ "RUBY" => 0
/Ruby/i =~ "rUBY" => 0
