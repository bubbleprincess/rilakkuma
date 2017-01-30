require "rack/test"
require "test/unit"
require "rilakkuma"

d = File.join(File.dirname(__FILE__), "..", "lib")
$LOAD_PATH.unshift File.expand_path(d)