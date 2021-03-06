structure Example =
struct

val rev = Test.single ("rev", Test.polyEq {show = Show.list Show.int},
                       fn _ => {expected = [3,2,1], actual = List.rev [1,2,3]})

val tl = Test.group ("tl", Test.polyEq {show = Show.list Show.int},
                     [fn _ => {expected = [2,3], actual = List.tl [1,2,3]}])

val hd = Test.single ("hd", Test.polyEq {show = Show.int},
                      fn _ => {expected = 1, actual = List.hd []})

val null = Test.assertTrue ("null", fn _ => List.null [])

fun main _ = (Test.runTestSuite (true, Test.concat [rev, tl, hd, null])
             ; OS.Process.success)

end
