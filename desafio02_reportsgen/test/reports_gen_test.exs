#defmodule ReportsGenTest do
#  use ExUnit.Case
#
#  describe "build/1" do
#    test "builds a report" do
#      filename = "gen_report.csv"
#
#      response = ReportsGen.build(filename)
#
#      expected_response = %{
#              "all_hours" => %{
#                "Cleiton" => 13797,
#                "Daniele" => 13264,
#                "Danilo" => 13583,
#                "Diego" => 13015,
#                "Giuliano" => 13671,
#                "Jakeliny" => 13909,
#                "Joseph" => 13174,
#                "Mayk" => 13526,
#                "Rafael" => 13597,
#                "Vinicius" => 13412
#              },
#              "hours_per_month" => %{
#                "Cleiton" => %{
#                  "Abril" => 1161,
#                  "Agosto" => 1149,
#                  "Dezembro" => 1100,
#                  "Fevereiro" => 1168,
#                  "Janeiro" => 1271,
#                  "Julho" => 1236,
#                  "Junho" => 1123,
#                  "Maio" => 998,
#                  "Março" => 1091,
#                  "Novembro" => 1266,
#                  "Outubro" => 1073,
#                  "Setembro" => 1161
#                },
#                "Daniele" => %{
#                  "Abril" => 1138,
#                  "Agosto" => 1018,
#                  "Dezembro" => 1019,
#                  "Fevereiro" => 1003,
#                  "Janeiro" => 1130,
#                  "Julho" => 1135,
#                  "Junho" => 1092,
#                  "Maio" => 1170,
#                  "Março" => 1177,
#                  "Novembro" => 1131,
#                  "Outubro" => 1046,
#                  "Setembro" => 1205
#                },
#                "Danilo" => %{
#                  "Abril" => 1232,
#                  "Agosto" => 1200,
#                  "Dezembro" => 1149,
#                  "Fevereiro" => 1156,
#                  "Janeiro" => 1121,
#                  "Julho" => 1114,
#                  "Junho" => 966,
#                  "Maio" => 1075,
#                  "Março" => 1096,
#                  "Novembro" => 1122,
#                  "Outubro" => 1237,
#                  "Setembro" => 1115
#                },
#                "Diego" => %{
#                  "Abril" => 1112,
#                  "Agosto" => 1129,
#                  "Dezembro" => 1177,
#                  "Fevereiro" => 1144,
#                  "Janeiro" => 1118,
#                  "Julho" => 1099,
#                  "Junho" => 1073,
#                  "Maio" => 1082,
#                  "Março" => 1029,
#                  "Novembro" => 995,
#                  "Outubro" => 928,
#                  "Setembro" => 1129
#                },
#                "Giuliano" => %{
#                  "Abril" => 1152,
#                  "Agosto" => 1126,
#                  "Dezembro" => 1100,
#                  "Fevereiro" => 1173,
#                  "Janeiro" => 1107,
#                  "Julho" => 1169,
#                  "Junho" => 1197,
#                  "Maio" => 1182,
#                  "Março" => 1097,
#                  "Novembro" => 1105,
#                  "Outubro" => 1123,
#                  "Setembro" => 1140
#                },
#                "Jakeliny" => %{
#                  "Abril" => 1172,
#                  "Agosto" => 1098,
#                  "Dezembro" => 1122,
#                  "Fevereiro" => 1119,
#                  "Janeiro" => 1118,
#                  "Julho" => 1245,
#                  "Junho" => 1182,
#                  "Maio" => 1129,
#                  "Março" => 1178,
#                  "Novembro" => 1085,
#                  "Outubro" => 1197,
#                  "Setembro" => 1264
#                },
#                "Joseph" => %{
#                  "Abril" => 1047,
#                  "Agosto" => 1167,
#                  "Dezembro" => 1122,
#                  "Fevereiro" => 1202,
#                  "Janeiro" => 1084,
#                  "Julho" => 1153,
#                  "Junho" => 1105,
#                  "Maio" => 1082,
#                  "Março" => 1038,
#                  "Novembro" => 1005,
#                  "Outubro" => 1058,
#                  "Setembro" => 1111
#                },
#                "Mayk" => %{
#                  "Abril" => 1016,
#                  "Agosto" => 1079,
#                  "Dezembro" => 1159,
#                  "Fevereiro" => 1085,
#                  "Janeiro" => 1100,
#                  "Julho" => 1093,
#                  "Junho" => 1190,
#                  "Maio" => 1173,
#                  "Março" => 1166,
#                  "Novembro" => 1257,
#                  "Outubro" => 1094,
#                  "Setembro" => 1114
#                },
#                "Rafael" => %{
#                  "Abril" => 1171,
#                  "Agosto" => 1199,
#                  "Dezembro" => 965,
#                  "Fevereiro" => 1042,
#                  "Janeiro" => 1125,
#                  "Julho" => 1097,
#                  "Junho" => 1218,
#                  "Maio" => 1141,
#                  "Março" => 1220,
#                  "Novembro" => 1163,
#                  "Outubro" => 1161,
#                  "Setembro" => 1095
#                },
#                "Vinicius" => %{
#                  "Abril" => 1149,
#                  "Agosto" => 1055,
#                  "Dezembro" => 1186,
#                  "Fevereiro" => 1102,
#                  "Janeiro" => 1036,
#                  "Julho" => 979,
#                  "Junho" => 1213,
#                  "Maio" => 1109,
#                  "Março" => 1191,
#                  "Novembro" => 1169,
#                  "Outubro" => 1113,
#                  "Setembro" => 1110
#                }
#              },
#              "hours_per_year" => %{
#                "Cleiton" => %{
#                  2016 => 2699,
#                  2017 => 2684,
#                  2018 => 2805,
#                  2019 => 2714,
#                  2020 => 2895
#                },
#                "Daniele" => %{
#                  2016 => 2573,
#                  2017 => 2862,
#                  2018 => 2633,
#                  2019 => 2562,
#                  2020 => 2634
#                },
#                "Danilo" => %{
#                  2016 => 2746,
#                  2017 => 2534,
#                  2018 => 2972,
#                  2019 => 2666,
#                  2020 => 2665
#                },
#                "Diego" => %{
#                  2016 => 2577,
#                  2017 => 2647,
#                  2018 => 2792,
#                  2019 => 2486,
#                  2020 => 2513
#                },
#                "Giuliano" => %{
#                  2016 => 2784,
#                  2017 => 2696,
#                  2018 => 2693,
#                  2019 => 2850,
#                  2020 => 2648
#                },
#                "Jakeliny" => %{
#                  2016 => 2869,
#                  2017 => 2625,
#                  2018 => 2765,
#                  2019 => 2709,
#                  2020 => 2941
#                },
#                "Joseph" => %{
#                  2016 => 2603,
#                  2017 => 2617,
#                  2018 => 2587,
#                  2019 => 2672,
#                  2020 => 2695
#                },
#                "Mayk" => %{
#                  2016 => 2644,
#                  2017 => 2735,
#                  2018 => 2770,
#                  2019 => 2778,
#                  2020 => 2599
#                },
#                "Rafael" => %{
#                  2016 => 2684,
#                  2017 => 2570,
#                  2018 => 2628,
#                  2019 => 2786,
#                  2020 => 2929
#                },
#                "Vinicius" => %{
#                  2016 => 2530,
#                  2017 => 2720,
#                  2018 => 2654,
#                  2019 => 2640,
#                  2020 => 2868
#                }
#              }
#            }
#
#      assert response == expected_response
#    end
#  end
#end