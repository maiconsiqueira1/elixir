# 💻 Sobre o desafio

Nesse desafio, você deverá gerar o mesmo relatório com os mesmos dados do desafio anterior mas dessa vez os dados estão fracionados em três arquivos com 10 mil linhas cada e o relatório deve ser gerado usando esses três arquivos em paralelo.

Observe que o resultado final do cálculo de horas de cada pessoa para ano, mês e total de horas deve ser o mesmo do desafio anterior, já que os dados continuam iguais.

O relatório gerado a partir dos arquivos (que estão disponíveis para download logo abaixo) deve estar no seguinte formato:

```elixir
%{
  all_hours: %{
        danilo: 500,
        rafael: 854,
        ...
    },
  hours_per_month: %{
        danilo: %{
            janeiro: 40,
            fevereiro: 64,
            ...
        },
        rafael: %{
            janeiro: 52,
            fevereiro: 37,
            ...
        }
    },
  hours_per_year: %{
        danilo: %{
            2016: 276,
            2017: 412,
            ...
        },
        rafael: %{
            2016: 376,
            2017: 348,
            ...
        }
    }
}
```

Os caracteres `...` é o espaço onde ficaria o resto dos dados. Esse é apenas um exemplo visual do que o retorno da função deve possuir, beleza?

## Download dos arquivos

[part_1.csv](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ef3f1650-5374-4430-bc33-e89b51ad949a/part_1.csv)

[part_2.csv](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/019635f0-d0ed-4b42-b69b-939d7492563c/part_2.csv)

[part_3.csv](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/4800edf6-8d81-4209-9841-b45a9d8fa951/part_3.csv)

---
