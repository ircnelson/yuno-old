require 'tzinfo/timezone_definition'

module TZInfo
  module Definitions
    module America
      module Santiago
        include TimezoneDefinition
        
        timezone 'America/Santiago' do |tz|
          tz.offset :o0, -16960, 0, :LMT
          tz.offset :o1, -16960, 0, :SMT
          tz.offset :o2, -18000, 0, :CLT
          tz.offset :o3, -18000, 3600, :CLST
          tz.offset :o4, -14400, 0, :CLT
          tz.offset :o5, -14400, 3600, :CLST
          
          tz.transition 1890, 1, :o1, 325534774, 135
          tz.transition 1910, 1, :o2, 326520814, 135
          tz.transition 1918, 9, :o3, 58124105, 24
          tz.transition 1919, 7, :o2, 7266425, 3
          tz.transition 1927, 9, :o3, 58202993, 24
          tz.transition 1928, 4, :o2, 7276013, 3
          tz.transition 1928, 9, :o3, 58211777, 24
          tz.transition 1929, 4, :o2, 7277108, 3
          tz.transition 1929, 9, :o3, 58220537, 24
          tz.transition 1930, 4, :o2, 7278203, 3
          tz.transition 1930, 9, :o3, 58229297, 24
          tz.transition 1931, 4, :o2, 7279298, 3
          tz.transition 1931, 9, :o3, 58238057, 24
          tz.transition 1932, 4, :o2, 7280396, 3
          tz.transition 1932, 9, :o4, 58246841, 24
          tz.transition 1966, 10, :o5, 7318223, 3
          tz.transition 1967, 3, :o4, 19516493, 8
          tz.transition 1967, 10, :o5, 7319336, 3
          tz.transition 1968, 3, :o4, 19519405, 8
          tz.transition 1968, 10, :o5, 7320428, 3
          tz.transition 1969, 3, :o4, 19522317, 8
          tz.transition 1969, 10, :o5, 7321520, 3
          tz.transition 1970, 3, :o4, 6318000
          tz.transition 1970, 10, :o5, 24465600
          tz.transition 1971, 3, :o4, 37767600
          tz.transition 1971, 10, :o5, 55915200
          tz.transition 1972, 3, :o4, 69217200
          tz.transition 1972, 10, :o5, 87969600
          tz.transition 1973, 3, :o4, 100666800
          tz.transition 1973, 10, :o5, 119419200
          tz.transition 1974, 3, :o4, 132116400
          tz.transition 1974, 10, :o5, 150868800
          tz.transition 1975, 3, :o4, 163566000
          tz.transition 1975, 10, :o5, 182318400
          tz.transition 1976, 3, :o4, 195620400
          tz.transition 1976, 10, :o5, 213768000
          tz.transition 1977, 3, :o4, 227070000
          tz.transition 1977, 10, :o5, 245217600
          tz.transition 1978, 3, :o4, 258519600
          tz.transition 1978, 10, :o5, 277272000
          tz.transition 1979, 3, :o4, 289969200
          tz.transition 1979, 10, :o5, 308721600
          tz.transition 1980, 3, :o4, 321418800
          tz.transition 1980, 10, :o5, 340171200
          tz.transition 1981, 3, :o4, 353473200
          tz.transition 1981, 10, :o5, 371620800
          tz.transition 1982, 3, :o4, 384922800
          tz.transition 1982, 10, :o5, 403070400
          tz.transition 1983, 3, :o4, 416372400
          tz.transition 1983, 10, :o5, 434520000
          tz.transition 1984, 3, :o4, 447822000
          tz.transition 1984, 10, :o5, 466574400
          tz.transition 1985, 3, :o4, 479271600
          tz.transition 1985, 10, :o5, 498024000
          tz.transition 1986, 3, :o4, 510721200
          tz.transition 1986, 10, :o5, 529473600
          tz.transition 1987, 3, :o4, 542775600
          tz.transition 1987, 10, :o5, 560923200
          tz.transition 1988, 3, :o4, 574225200
          tz.transition 1988, 10, :o5, 592372800
          tz.transition 1989, 3, :o4, 605674800
          tz.transition 1989, 10, :o5, 624427200
          tz.transition 1990, 3, :o4, 637124400
          tz.transition 1990, 10, :o5, 655876800
          tz.transition 1991, 3, :o4, 668574000
          tz.transition 1991, 10, :o5, 687326400
          tz.transition 1992, 3, :o4, 700628400
          tz.transition 1992, 10, :o5, 718776000
          tz.transition 1993, 3, :o4, 732078000
          tz.transition 1993, 10, :o5, 750225600
          tz.transition 1994, 3, :o4, 763527600
          tz.transition 1994, 10, :o5, 781675200
          tz.transition 1995, 3, :o4, 794977200
          tz.transition 1995, 10, :o5, 813729600
          tz.transition 1996, 3, :o4, 826426800
          tz.transition 1996, 10, :o5, 845179200
          tz.transition 1997, 3, :o4, 857876400
          tz.transition 1997, 10, :o5, 876628800
          tz.transition 1998, 3, :o4, 889930800
          tz.transition 1998, 9, :o5, 906868800
          tz.transition 1999, 4, :o4, 923194800
          tz.transition 1999, 10, :o5, 939528000
          tz.transition 2000, 3, :o4, 952830000
          tz.transition 2000, 10, :o5, 971582400
          tz.transition 2001, 3, :o4, 984279600
          tz.transition 2001, 10, :o5, 1003032000
          tz.transition 2002, 3, :o4, 1015729200
          tz.transition 2002, 10, :o5, 1034481600
          tz.transition 2003, 3, :o4, 1047178800
          tz.transition 2003, 10, :o5, 1065931200
          tz.transition 2004, 3, :o4, 1079233200
          tz.transition 2004, 10, :o5, 1097380800
          tz.transition 2005, 3, :o4, 1110682800
          tz.transition 2005, 10, :o5, 1128830400
          tz.transition 2006, 3, :o4, 1142132400
          tz.transition 2006, 10, :o5, 1160884800
          tz.transition 2007, 3, :o4, 1173582000
          tz.transition 2007, 10, :o5, 1192334400
          tz.transition 2008, 3, :o4, 1205031600
          tz.transition 2008, 10, :o5, 1223784000
          tz.transition 2009, 3, :o4, 1237086000
          tz.transition 2009, 10, :o5, 1255233600
          tz.transition 2010, 3, :o4, 1268535600
          tz.transition 2010, 10, :o5, 1286683200
          tz.transition 2011, 3, :o4, 1299985200
          tz.transition 2011, 10, :o5, 1318132800
          tz.transition 2012, 3, :o4, 1331434800
          tz.transition 2012, 10, :o5, 1350187200
          tz.transition 2013, 3, :o4, 1362884400
          tz.transition 2013, 10, :o5, 1381636800
          tz.transition 2014, 3, :o4, 1394334000
          tz.transition 2014, 10, :o5, 1413086400
          tz.transition 2015, 3, :o4, 1426388400
          tz.transition 2015, 10, :o5, 1444536000
          tz.transition 2016, 3, :o4, 1457838000
          tz.transition 2016, 10, :o5, 1475985600
          tz.transition 2017, 3, :o4, 1489287600
          tz.transition 2017, 10, :o5, 1508040000
          tz.transition 2018, 3, :o4, 1520737200
          tz.transition 2018, 10, :o5, 1539489600
          tz.transition 2019, 3, :o4, 1552186800
          tz.transition 2019, 10, :o5, 1570939200
          tz.transition 2020, 3, :o4, 1584241200
          tz.transition 2020, 10, :o5, 1602388800
          tz.transition 2021, 3, :o4, 1615690800
          tz.transition 2021, 10, :o5, 1633838400
          tz.transition 2022, 3, :o4, 1647140400
          tz.transition 2022, 10, :o5, 1665288000
          tz.transition 2023, 3, :o4, 1678590000
          tz.transition 2023, 10, :o5, 1697342400
          tz.transition 2024, 3, :o4, 1710039600
          tz.transition 2024, 10, :o5, 1728792000
          tz.transition 2025, 3, :o4, 1741489200
          tz.transition 2025, 10, :o5, 1760241600
          tz.transition 2026, 3, :o4, 1773543600
          tz.transition 2026, 10, :o5, 1791691200
          tz.transition 2027, 3, :o4, 1804993200
          tz.transition 2027, 10, :o5, 1823140800
          tz.transition 2028, 3, :o4, 1836442800
          tz.transition 2028, 10, :o5, 1855195200
          tz.transition 2029, 3, :o4, 1867892400
          tz.transition 2029, 10, :o5, 1886644800
          tz.transition 2030, 3, :o4, 1899342000
          tz.transition 2030, 10, :o5, 1918094400
          tz.transition 2031, 3, :o4, 1930791600
          tz.transition 2031, 10, :o5, 1949544000
          tz.transition 2032, 3, :o4, 1962846000
          tz.transition 2032, 10, :o5, 1980993600
          tz.transition 2033, 3, :o4, 1994295600
          tz.transition 2033, 10, :o5, 2012443200
          tz.transition 2034, 3, :o4, 2025745200
          tz.transition 2034, 10, :o5, 2044497600
          tz.transition 2035, 3, :o4, 2057194800
          tz.transition 2035, 10, :o5, 2075947200
          tz.transition 2036, 3, :o4, 2088644400
          tz.transition 2036, 10, :o5, 2107396800
          tz.transition 2037, 3, :o4, 2120698800
          tz.transition 2037, 10, :o5, 2138846400
          tz.transition 2038, 3, :o4, 19723973, 8
          tz.transition 2038, 10, :o5, 7397120, 3
          tz.transition 2039, 3, :o4, 19726885, 8
          tz.transition 2039, 10, :o5, 7398212, 3
          tz.transition 2040, 3, :o4, 19729797, 8
          tz.transition 2040, 10, :o5, 7399325, 3
          tz.transition 2041, 3, :o4, 19732709, 8
          tz.transition 2041, 10, :o5, 7400417, 3
          tz.transition 2042, 3, :o4, 19735621, 8
          tz.transition 2042, 10, :o5, 7401509, 3
          tz.transition 2043, 3, :o4, 19738589, 8
          tz.transition 2043, 10, :o5, 7402601, 3
          tz.transition 2044, 3, :o4, 19741501, 8
          tz.transition 2044, 10, :o5, 7403693, 3
          tz.transition 2045, 3, :o4, 19744413, 8
          tz.transition 2045, 10, :o5, 7404806, 3
          tz.transition 2046, 3, :o4, 19747325, 8
          tz.transition 2046, 10, :o5, 7405898, 3
          tz.transition 2047, 3, :o4, 19750237, 8
          tz.transition 2047, 10, :o5, 7406990, 3
          tz.transition 2048, 3, :o4, 19753205, 8
          tz.transition 2048, 10, :o5, 7408082, 3
          tz.transition 2049, 3, :o4, 19756117, 8
          tz.transition 2049, 10, :o5, 7409174, 3
          tz.transition 2050, 3, :o4, 19759029, 8
        end
      end
    end
  end
end
