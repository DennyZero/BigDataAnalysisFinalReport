library(dplyr)
library(lubridate)
#Import Data
NewTaipei_Houseprice_S1 <- read.csv("~/GitHub/BigDataAnalysisFinalReport/NT_106_S1/F_lvr_land_A.csv", header=FALSE, stringsAsFactors=FALSE,skip = 2) %>%
  rbind(read.csv("~/GitHub/BigDataAnalysisFinalReport/NT_106_S1/F_lvr_land_B.csv", header=FALSE, stringsAsFactors=FALSE,skip = 2))
NewTaipei_Houseprice_S2 <- read.csv("~/GitHub/BigDataAnalysisFinalReport/NT_106_S2/F_lvr_land_A.csv", header=FALSE, stringsAsFactors=FALSE,skip = 2) %>%
  rbind(read.csv("~/GitHub/BigDataAnalysisFinalReport/NT_106_S2/F_lvr_land_B.csv", header=FALSE, stringsAsFactors=FALSE,skip = 2))
NewTaipei_Houseprice_S3 <- read.csv("~/GitHub/BigDataAnalysisFinalReport/NT_106_S3/F_lvr_land_A.csv", header=FALSE, stringsAsFactors=FALSE,skip = 2) %>%
  rbind(read.csv("~/GitHub/BigDataAnalysisFinalReport/NT_106_S3/F_lvr_land_B.csv", header=FALSE, stringsAsFactors=FALSE,skip = 2))
NewTaipei_Houseprice_S4 <- read.csv("~/GitHub/BigDataAnalysisFinalReport/NT_106_S4/F_lvr_land_A.csv", header=FALSE, stringsAsFactors=FALSE,skip = 2) %>%
  rbind(read.csv("~/GitHub/BigDataAnalysisFinalReport/NT_106_S4/F_lvr_land_B.csv", header=FALSE, stringsAsFactors=FALSE,skip = 2))
#Change dataframe column name
colnames(NewTaipei_Houseprice_S1) <- c("鄉鎮市區","交易標的","土地區段位置/建物區段門牌","土地移轉總面積(平方公尺)","都市土地使用分區",
  "非都市土地使用分區","非都市土地使用編定","交易年月日","交易筆棟數","移轉層次","總樓層數","建物型態",
  "主要用途","主要建材","建築完成年月","建物移轉總面積(平方公尺)","建物現況格局-房","建物現況格局-廳",
  "建物現況格局-衛","建物現況格局-隔間","有無管理組織","總價(元)","單價(元/平方公尺)","車位類別","車位移轉總面積(平方公尺)",
  "車位總價(元)","備註","編號")
colnames(NewTaipei_Houseprice_S2) <- c("鄉鎮市區","交易標的","土地區段位置/建物區段門牌","土地移轉總面積(平方公尺)","都市土地使用分區",
                              "非都市土地使用分區","非都市土地使用編定","交易年月日","交易筆棟數","移轉層次","總樓層數","建物型態",
                              "主要用途","主要建材","建築完成年月","建物移轉總面積(平方公尺)","建物現況格局-房","建物現況格局-廳",
                              "建物現況格局-衛","建物現況格局-隔間","有無管理組織","總價(元)","單價(元/平方公尺)","車位類別","車位移轉總面積(平方公尺)",
                              "車位總價(元)","備註","編號")
colnames(NewTaipei_Houseprice_S3) <- c("鄉鎮市區","交易標的","土地區段位置/建物區段門牌","土地移轉總面積(平方公尺)","都市土地使用分區",
                                       "非都市土地使用分區","非都市土地使用編定","交易年月日","交易筆棟數","移轉層次","總樓層數","建物型態",
                                       "主要用途","主要建材","建築完成年月","建物移轉總面積(平方公尺)","建物現況格局-房","建物現況格局-廳",
                                       "建物現況格局-衛","建物現況格局-隔間","有無管理組織","總價(元)","單價(元/平方公尺)","車位類別","車位移轉總面積(平方公尺)",
                                       "車位總價(元)","備註","編號")
colnames(NewTaipei_Houseprice_S4) <- c("鄉鎮市區","交易標的","土地區段位置/建物區段門牌","土地移轉總面積(平方公尺)","都市土地使用分區",
                                       "非都市土地使用分區","非都市土地使用編定","交易年月日","交易筆棟數","移轉層次","總樓層數","建物型態",
                                       "主要用途","主要建材","建築完成年月","建物移轉總面積(平方公尺)","建物現況格局-房","建物現況格局-廳",
                                       "建物現況格局-衛","建物現況格局-隔間","有無管理組織","總價(元)","單價(元/平方公尺)","車位類別","車位移轉總面積(平方公尺)",
                                       "車位總價(元)","備註","編號")
#Change data from chr to numic,delete old than 2015-01-01 house data
#2017 Season 1 House finish Date
NewTaipei_Houseprice_S1$建築完成年月 <- as.numeric(NewTaipei_Houseprice_S1$建築完成年)
NewTaipei_Houseprice_S1 <- NewTaipei_Houseprice_S1[!is.na(NewTaipei_Houseprice_S1$建築完成年月),]
NewTaipei_Houseprice_S1$建築完成年月 <- NewTaipei_Houseprice_S1$建築完成年月+19110000
NewTaipei_Houseprice_S1 <- NewTaipei_Houseprice_S1[NewTaipei_Houseprice_S1$建築完成年月>20150000,]
NewTaipei_Houseprice_S1$建築完成年月 <- ymd(NewTaipei_Houseprice_S1$建築完成年月)
#2017 Season 2 House finish Date
NewTaipei_Houseprice_S2$建築完成年月 <- as.numeric(NewTaipei_Houseprice_S2$建築完成年)
NewTaipei_Houseprice_S2 <- NewTaipei_Houseprice_S2[!is.na(NewTaipei_Houseprice_S2$建築完成年月),]
NewTaipei_Houseprice_S2$建築完成年月 <- NewTaipei_Houseprice_S2$建築完成年月+19110000
NewTaipei_Houseprice_S2 <- NewTaipei_Houseprice_S2[NewTaipei_Houseprice_S2$建築完成年月>20150000,]
NewTaipei_Houseprice_S2$建築完成年月 <- ymd(NewTaipei_Houseprice_S2$建築完成年月)
#2017 Season 3 House finish Date
NewTaipei_Houseprice_S3$建築完成年月 <- as.numeric(NewTaipei_Houseprice_S3$建築完成年)
NewTaipei_Houseprice_S3 <- NewTaipei_Houseprice_S3[!is.na(NewTaipei_Houseprice_S3$建築完成年月),]
NewTaipei_Houseprice_S3$建築完成年月 <- NewTaipei_Houseprice_S3$建築完成年月+19110000
NewTaipei_Houseprice_S3 <- NewTaipei_Houseprice_S3[NewTaipei_Houseprice_S3$建築完成年月>20150000,]
NewTaipei_Houseprice_S3$建築完成年月 <- ymd(NewTaipei_Houseprice_S3$建築完成年月)
#2017 Season 4 House finish Date
NewTaipei_Houseprice_S4$建築完成年月 <- as.numeric(NewTaipei_Houseprice_S4$建築完成年)
NewTaipei_Houseprice_S4 <- NewTaipei_Houseprice_S4[!is.na(NewTaipei_Houseprice_S4$建築完成年月),]
NewTaipei_Houseprice_S4$建築完成年月 <- NewTaipei_Houseprice_S4$建築完成年月+19110000
NewTaipei_Houseprice_S4 <- NewTaipei_Houseprice_S4[NewTaipei_Houseprice_S4$建築完成年月>20150000,]
NewTaipei_Houseprice_S4$建築完成年月 <- ymd(NewTaipei_Houseprice_S4$建築完成年月)
#change the money into numic, delete NA data
NewTaipei_Houseprice_S1$`單價(元/平方公尺)` <- as.numeric(NewTaipei_Houseprice_S1$`單價(元/平方公尺)` )
NewTaipei_Houseprice_S1 <- NewTaipei_Houseprice_S1[!is.na(NewTaipei_Houseprice_S1$`單價(元/平方公尺)`),]
NewTaipei_Houseprice_S2$`單價(元/平方公尺)` <- as.numeric(NewTaipei_Houseprice_S2$`單價(元/平方公尺)` )
NewTaipei_Houseprice_S2 <- NewTaipei_Houseprice_S2[!is.na(NewTaipei_Houseprice_S2$`單價(元/平方公尺)`),]
NewTaipei_Houseprice_S3$`單價(元/平方公尺)` <- as.numeric(NewTaipei_Houseprice_S3$`單價(元/平方公尺)` )
NewTaipei_Houseprice_S3 <- NewTaipei_Houseprice_S3[!is.na(NewTaipei_Houseprice_S3$`單價(元/平方公尺)`),]
NewTaipei_Houseprice_S4$`單價(元/平方公尺)` <- as.numeric(NewTaipei_Houseprice_S4$`單價(元/平方公尺)` )
NewTaipei_Houseprice_S4 <- NewTaipei_Houseprice_S4[!is.na(NewTaipei_Houseprice_S4$`單價(元/平方公尺)`),]
#average price, group by area
S1_Price_ave <- group_by(NewTaipei_Houseprice_S1,鄉鎮市區) %>%
  summarise(meanPrice = mean(`單價(元/平方公尺)`))
S2_Price_ave <- group_by(NewTaipei_Houseprice_S2,鄉鎮市區) %>%
  summarise(meanPrice = mean(`單價(元/平方公尺)`))
S3_Price_ave <- group_by(NewTaipei_Houseprice_S3,鄉鎮市區) %>%
  summarise(meanPrice = mean(`單價(元/平方公尺)`))
S4_Price_ave <- group_by(NewTaipei_Houseprice_S4,鄉鎮市區) %>%
  summarise(meanPrice = mean(`單價(元/平方公尺)`))
colnames(S1_Price_ave) <- c("鄉鎮市區","單價(元/平方公尺)")
colnames(S2_Price_ave) <- c("鄉鎮市區","單價(元/平方公尺)")
colnames(S3_Price_ave) <- c("鄉鎮市區","單價(元/平方公尺)")
colnames(S4_Price_ave) <- c("鄉鎮市區","單價(元/平方公尺)")