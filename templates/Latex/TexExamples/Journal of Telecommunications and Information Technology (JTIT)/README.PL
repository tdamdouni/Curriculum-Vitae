jtitauth.cls
============

Wersja klasy dla czasopisma "Journal of  Telecommunications and
Information Technology" dla autorów.

Wymagania:
==========
Klasa jest przeznaczona dla systemu LateX2e. Do dzia³ania wymaga
nastêpuj±cych pakietów standardowych:
* amsmath
* mathptmx 
* times
* graphicx
* color
* fancyhdr

Klasa jest w zgodna ze standardow± klas± article tzn. ka¿dy artyku³
z³o¿ony z wykorzystaniem klasy article powinien daæ siê przetworzyæ
bez b³êdów z wykorzystaniem klasy jtitauth. 

W klasie jest wykorzystany pakiet amsmath, wiêc przy wpisywaniu mo¿na
wykorzystywaæ mo¿liwo¶ci pakiety AMSLaTeX.

Po rozpakownaniu nale¿y przegrac plik: jtitauth.cls do katalogu
z przygotowywanym dokumentem.

Zasady znakowania tekstu s± identyczne ze zasadami opisanymi w
dokumentacji i podrêcznikach dla systemu LaTeX. Dokumentacja dla
pocz±tkuj±cych u¿ytkowników systemu jest dostêpna w sieci Internet (np.
http://www.gust.org.pl/doc.html).

Rozszerzenia:
=============

Zgodnie z wymogami redakcji artyku³y zawieraj± listê s³ów kluczowych.
Do umieszczenia s³ów kluczowych w dokumencie s³u¿y ¶rodowisko
"keywords"

Wymagane przez redakcjê nag³ówki tworzy siê z wykorzystaniem
standardowego dwuargumentowego polecenia \markboth: pierwszym
parametrem powinny byæ nazwiska autorów, drugim tytu³ artyku³u (ew. w
razie potrzeby skrócona wersja).

Przyk³ad:
=========

Przyk³adowy artyku³ wykorzystuj±cy klasê jtitauth znajduje siê w pliku 
example.tex
