defmodule Estate.Cities do
  import EstateWeb.Gettext

  def search_by_city(city_name) do
    Process.sleep(4000)

    list_cities()
    |> Enum.filter(&(&1.name == city_name))
  end

  def suggest(prefix) do
    list_cities()
    |> Enum.filter(fn city -> String.starts_with?(city.name, prefix) end)
    |> Enum.map(&(&1.name))
  end

  # name: <%= gettext <%= gettext gettext("Los Angeles" %>,
  # <%= gettext <%= gettext gettext("
  # <%= gettext gettext(" %>,

  def list_cities do
    [
      %{
        name: gettext("Los Angeles"),
        population: 39776830,
        has_airport: true,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("San Francisco"),
        population: 883305,
        has_airport: true,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("San Diego"),
        population: 3283665,
        has_airport: true,
        has_cultural_events: true,
        preferred_for_young_people: false
      },
      %{
        name: gettext("San Jose"),
        population: 1021795,
        has_airport: true,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Sacramento"),
        population: 508529,
        has_airport: true,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Fresno"),
        population: 502303,
        has_airport: true,
        has_cultural_events: true,
        preferred_for_young_people: false
      },
      %{
        name: gettext("Oakland"),
        population: 425204,
        has_airport: true,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Long Beach"),
        population: 467354,
        has_airport: true,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Bakersfield"),
        population: 384145,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: false
      },
      %{
        name: gettext("Anaheim"),
        population: 350365,
        has_airport: true,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Riverside"),
        population: 327728,
        has_airport: true,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Santa Ana"),
        population: 332482,
        has_airport: true,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Irvine"),
        population: 277453,
        has_airport: true,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("San Bernardino"),
        population: 216995,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: false
      },
      %{
        name: gettext("Modesto"),
        population: 212175,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: false
      },
      %{
        name: gettext("Oxnard"),
        population: 210846,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: false
      },
      %{
        name: gettext("Fontana"),
        population: 209665,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: false
      },
      %{
        name: gettext("Moreno Valley"),
        population: 209111,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Glendale"),
        population: 201361,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Huntington Beach"),
        population: 197575,
        has_airport: true,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Santa Clarita"),
        population: 210089,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Garden Grove"),
        population: 175023,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Oceanside"),
        population: 175464,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Rancho Cucamonga"),
        population: 177452,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Santa Rosa"),
        population: 176753,
        has_airport: true,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Ontario"),
        population: 175841,
        has_airport: true,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Lancaster"),
        population: 160316,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: false
      },
      %{
        name: gettext("Elk Grove"),
        population: 172198,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Palmdale"),
        population: 156305,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: false
      },
      %{
        name: gettext("Corona"),
        population: 168819,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Salinas"),
        population: 157218,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Pomona"),
        population: 152939,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Torrance"),
        population: 147195,
        has_airport: true,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Hayward"),
        population: 160500,
        has_airport: true,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Escondido"),
        population: 151658,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: false
      },
      %{
        name: gettext("Orange"),
        population: 139484,
        has_airport: true,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Fullerton"),
        population: 138673,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Roseville"),
        population: 128798,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Visalia"),
        population: 134605,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: false
      },
      %{
        name: gettext("Simi Valley"),
        population: 124788,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Concord"),
        population: 126336,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Cypress"),
        population: 490,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Pasadena"),
        population: 303532,
        has_airport: true,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Lancaster"),
        population: 160106,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: false
      },
      %{
        name: gettext("Hayward"),
        population: 127741,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("East Los Angeles"),
        population: 126496,
        has_airport: true,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Simi Valley"),
        population: 111012,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Inglewood"),
        population: 118354,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Murrieta"),
        population: 135752,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Clovis"),
        population: 130006,
        has_airport: true,
        has_cultural_events: false,
        preferred_for_young_people: false
      },
      %{
        name: gettext("Santa Clara"),
        population: 126071,
        has_airport: true,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Costa Mesa"),
        population: 118719,
        has_airport: false,
        has_cultural_events: true,
        preferred_for_young_people: true
      },
      %{
        name: gettext("Carlsbad"),
        population: 128506,
        has_airport: true,
        has_cultural_events: true,
        preferred_for_young_people: true
      }
    ]
  end
end
