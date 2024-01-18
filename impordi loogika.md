On hulganisti (ja aegamööda lisandub) identse loogikaga import.* tabeleid.

## Tabelid:
- album_academicum
- el_kart
- kirmus4
- leinakuulutused
- pensionitoimikud
- polisforhor
- R14-R16 (ümber nimetada R14_R16)
- rahvastikuregister
- repr_kart
- swedish_death_index

Erikohtlemist vajab "import.rahvastikuregister"

## Loogika:
Jälgida tuleb imporditabeli tulpasid 'persoon' ja 'pereregister'

#### Persooni välja võimalikud muutused:
1. NULL -> persoonikood;
2. NULL -> '0';
3. persoonikood -> NULL;
4. persoonikood -> persoonikood;
5. persoonikood -> '0';
6. muutuseta NULL;
7. muutuseta persoonikood.

#### Pereregistri välja võimalikud muudatused:
1. NULL -> kirjekood;
2. kirjekood -> kirjekood;
3. kirjekood -> NULL;
4. muutuseta NULL;
5. muutuseta kirjekood.

### Loogika peab olema valmis kõigiks 7 x 5 - 4 = 31 erinevaks stsenaariumiks
(4 triviaalset muutusteta kombinatsiooni mingit edasist loogikat ei käivita)

### [Imporditabelite loogika](https://github.com/orgs/memoriaal/projects/1/views/1?filterQuery=repis&pane=issue&itemId=50236663)