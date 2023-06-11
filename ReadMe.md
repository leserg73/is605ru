# Inno Setup v6.0.5 RUS

Неофициальная сборка Inno Setup v6.0.5 на русском языке, в которую встроена поддержка визуальных стилей *.vsf. Теперь не нужно использовать сторонние библиотеки и писать соответствующий код для применения стиля. Достаточно в сценарии указать параметр SetupStyleFile с выбранным файлом стиля и на этом все. Компиляция выполнена с максимальной поддержкой VCL компонентов (в пределах возможностей библиотеки RemObjects Pascal Script), а также дополнена некоторыми функциями и параметрами из расширенной версии компилятора от RESTOOLS.

Разработка данной модификации ведётся на базе исходного кода [Inno Setup](https://github.com/jrsoftware/issrc) (Copyright© Jordan Russell и Martijn Laan), компонента [VCL Styles Utils](https://github.com/RRUZ/vcl-styles-utils) (Copyright© Rodrigo Ruz) и компонента [SynTaskDialog](https://github.com/synopse/mORMot) (Copyright© Synopse Informatique).

## Состав (только модифицированные файлы!)

- **ISCmplr.dll** – библиотека компиляции сценариев для Compil32 и ISCC;
- **ISPP.dll** – библиотека реализующая интерфейс препроцессора Inno Setup;
- **Setup.e32** – модуль программы установки (интерфейс мастера и выполнение);
- **SetupLdr.e32** – модуль загрузчика для программы установки (распаковка и запуск);
- **ISCC.exe** – интерфейс командной строки для компилятора (русский);
- **Compil32.exe** – графический интерфейс для компилятора (русский, расширенный).

*Примечание*:

* компиляция файлов ISPP.dll, SetupLdr.e32, ISCC.exe выполнена в *Delphi 2009*;
* компиляция файлов ISCmplr.dll, Setup.e32, Compil32.exe — *Delphi 10.3.3 Rio Community*.

### Особенности

Добавлена поддержка ОС Windows XP, при этом сам установщик поддерживает эту систему не полностью, ввиду использования функций, недоступных в Windows XP. Поэтому на этих системах в работе сложных инсталляторов возможны ошибки, сбои и отказы. Также удалены записи вызова библиотек DLL, повышающих безопасность пользовательских системы от возможной атаки предварительной загрузки DLL. Это сделано для поддержки ОС Windows Vista.

### Основные отличия

* **SetupStyleFile** (директива секции \[Setup\]) – применение визуального стиля (файлы с расширением .vsf).

  *Примеры*.

    1\) Файл стиля находится в одной папке с файлом сценария:
 
     > **SetupStyleFile**=Glow.vsf

    2\) Файл стиля находится в каталоге Inno Setup, в подпапке "Styles":

     > **SetupStyleFile**=compiler:Styles\Glow.vsf
 
    3\) Файл стиля находится в определенном каталоге:

     > **SetupStyleFile**=D:\My Files\For Install\VCL Style\Glow.vsf

* **DirSelectModern** (директива секции \[Setup]\) – включение диалога выбора папки в стиле Vista (только для систем Vista и выше, на системе Windows XP будет показан стандартный диалог Inno Setup). *Значение по умолчанию* – **False**;

* **TaskBarView** (директива секции \[Setup\]) – включение отображения эскиза окна установки на Панели задач. *Значение по умолчанию* – **False**, т.е. стандартное поведение мастера установки.<br><br>Также доступны следующие процедуры для кастомизации информации панели и эскиза окна установки на Панели задач:

  1\. **SetAppTaskbarProgressValue(const Completed: Integer)** – позволяет указать процент выполнения текущей задачи.<br>Действительные значения от 0 до 100.<br>

     > *Пример*: SetAppTaskbarProgressValue(10);

  2\. **SetAppTaskbarProgressState(const State: TTaskbarProgressState)** – позволяет указать состояние прогресс-бара.

     Доступные состояния:<br>
     - **tpsNoProgress** – прогресс не отображается;<br>
     - **tpsIndeterminate** – прогресс бар постоянно мерцает;<br>
     - **tpsNormal** – обычное отображение прогресса;<br>
     - **tpsError** – отображение ошибки;<br>
     - **tpsPaused** – отображение паузы.<br><br>

     > *Пример*: SetAppTaskbarProgressState(tpsPaused);

  3\. **SetAppTaskbarThumbnailTooltip(const ToolTipStr: String)** – позволяет установить текст всплывающей подсказки при наведении курсора мышки на экскиз.<br>

     > *Пример*: SetAppTaskbarThumbnailTooltip('Application');

  4\. **SetAppTaskbarOverlayIconRes(const ResOvIcon: String)** – позволяет добавить иконку состояния к основному значку приложения. Эта процедура добавляет иконку из ресурсов программы установки.

     > _Пример_: SetAppTaskbarOverlayIconRes('_IS_OVICON');

     Чтобы добавить иконку в ресурсы файла инсталлятора, нужно использовать директиву **IconResource** в секции \[Setup\] (см. далее).

     > *Пример*: **IconResource**=ovicon>okR.ico

     где ovicon – имя ресурса (любое без пробелов);
         okR.ico – файл значка 16х16 пикс. с глубиной цвета 32-бит.<br>
         Использовать значки большего размера нет смысла, т.к. они все равно автоматически будут уменьшены до 16х16.

     При записи в ресурсы инсталлятора к имени иконки будет добавлена приставка "\_IS\_".
     Таким образом для загрузки иконки из ресурсов инсталлятора необходимо указать имя "\_IS\_OVICON".
     Чтобы удалить иконку состояния, в функции необходимо передать пустое значение: SetAppTaskbarOverlayIconRes('');

  5\. **SetAppTaskbarOverlayIconFile(const FileIcon: String)** – позволяет добавить иконку состояния к основному значку приложения, но уже из внешнего файла.

     > *Пример*: SetAppTaskbarOverlayIconFile(ExpandConstant('{tmp}\okR.ico'));

     Чтобы удалить иконку состояния, в функции необходимо передать пустое значение: SetAppTaskbarOverlayIconFile('');

* Компонент **TNewStaticText** поддерживает свойство "*Transparent*" со значением по умолчанию "**True**";

* Компоненту **TNewCheckListBox** добавлена поддержка VCL Style, а также свойства: "*ItemFontStyle*", "*SubItemFontStyle*", "*ItemFontColor*", "*SubItemFontColor*";

* Для Windows XP добавлена поддержка диалогов задач (TaskDialog), появившихся в Windows Vista. Это сделано на базе стороннего компонента SynTaskDialog.

* Поддержка стандартных компонентов VCL и их свойств (в пределах возможностей библиотеки RemObjects Pascal Script): TMemoryStream, TResourceStream, TParser, TCollectionItem, TCollection, TIcon, TControlScrollBar, TScrollBox, TApplication, TScreen, TGroupBox, TNewGroupBox, TScrollBar, TTrackBar, TUpDown, THotKey, TImageList, TStatusBar, TListView, TShape, TImage, TPaintBox, THeader, TTimer, TSpeedButton, TBitBtn, TMenu, TPopupMenu, TPicture, TPngImage, TMargins, TPadding, THintWindow, TCustomHintWindow, TCustomHint, TBalloonHint, TCustomColorBox, TColorBox, TCustomForm, TCustomCanvas, TMetafile, TMetafileCanvas, TCustomMaskEdit, TCustomTreeView, TTreeView, TTreeNodes, TTreeNode, THeaderControl, THeaderSections, THeaderSection, TPageControl, TTabSheet, TTabControl, TCustomTabControl, TTab;

* Поддержка компонентами свойств: *OnMouseEnter*, *OnMouseLeave*, *DoubleBuffered* и *ParentDoubleBuffered*;

* У компонента **TNewButton** активирован метод *Click*;

* Поддержка изображений в формате JPG, PNG;

#### Дополнения от RESTOOLS

* Директива **IS_ENHANCED** для препроцессора Inno Setup, объявлена по умолчанию;

* Константа **{apphwnd}** – возвращает дескриптор Application программы установки (эквивалент Application.handle в Delphi);

* Функции и процедуры:

    + procedure **Randomize** – включение генератора случайных чисел;
    + function **FormatFloat(const Format: String; Value: Extended): String;** – форматирование числа с плавающей запятой в строку;
    + procedure **ExtractTemporaryFileEx(const FileName: String; const DestDir: String);** – распаковка файла в указанный каталог;
    + procedure **ExtractTemporaryFileToStream(const FileName: String; const Stream: TStream);** – распаковка файла в память;
    + procedure **ExtractTemporaryFileToBuffer(const FileName: String; Buffer: Integer);** – распаковка файла в буфер (макс. размер 256 Кб).
    + function **ExtractTemporaryFileSize(const FileName: String): Cardinal;** – получение размера файла;
    + function **CastAnsiStringToInteger(var S: AnsiString): Longint;**
    + function **CastIntegerToAnsiString(const L: Longint): AnsiString;**.

* Функции **Windows API**:

    + function **FindResource(ModuleHandle: Longint; ResourceName, ResourceType: PAnsiChar): Longint;** – выясняет место ресурса с заданным типом и именем в указанном модуле;
    + function **LoadResource(ModuleHandle: Longint; ResHandle: Longint): Longint;** – загружает указанный ресурс в глобальную память;
    + function **SizeofResource(ModuleHandle: Longint; ResHandle: Longint): Integer;** – возвращает размер указанного ресурса в байтах;
    + function **LockResource(ResData: Longint): Longint;** – блокирует указанный ресурс в памяти;
    + function **UnlockResource(ResData: Longint): Boolean;** – разблокирует указанный ресурс в памяти;
    + function **FreeResource(ResData: Longint): Boolean;** – освобождает память связанную с ресурсом;
    + function **LoadCursorFromFile(lpFileName: String): Cardinal;** – создает и загружает курсор из указанного файла (.cur, .ani);
    + function **LoadImage(hInst: LongInt; ImageName: String; ImageType: LongWord; X, Y: Integer; Flags: LongWord): LongInt;** – загружает значок, курсор или изображение BMP;
    + function **DrawIconEx(hdc: LongInt; xLeft, yTop: Integer; hIcon: Integer; cxWidth, cyWidth: Integer; istepIfAniCur: LongWord; hbrFlickerFreeDraw: LongWord; diFlags: LongWord): Boolean;** – рисует значок или курсор в контекст указанного устройства;
    + function **DestroyIcon(hIcon: Integer): Boolean;** – разрушает значок и освобождает любую память занятую значком;
    + function **SetWindowText(hWnd: HWND; const lpString: String): Boolean;** – изменяет текст заголовка заданного окна;

* Директивы секции \[Setup\]:

  + **BitmapResource** – добавление в ресурсы файла установки изображений Bitmap.

     > *Пример*: **BitmapResource**=MyBmp1>Resource\2000a.bmp

     Формат BitmapResource:

     BmpResName1>BmpFileName1,..BmpResNameN>BmpFileNameN

     *Примечание*: при записи к имени ресурса добавляется приставка "\_IS\_".
     Поэтому, при вызове такого ресурса к его имени следует добавлять "\_IS\_".

     > *Пример*: Bitmap.LoadFromResourceName(HInstance, '_IS_MYBMP1');

  + **IconResource** – добавление в ресурсы файла установки значков Icon.

     > *Пример*: **IconResource**=MyIcon1>Resource\2000a.ico

     Формат IconResource:

     IcoResName1>IconFileName1,..IcoResNameN>IconFileNameN

     *Примечание*: при записи к имени ресурса добавляется приставка "\_IS\_".
     Поэтому, при вызове такого ресурса к его имени следует добавлять "\_IS\_".

     > *Пример*: LoadIcon(HInstance, '_IS_MYICON1');

  + **RawDataResource** – добавление в ресурсы файла установки других данных.

     > *Пример*: **RawDataResource**=MyFile1>Resource\Readme1.txt

     Формат RawDataResource:

     RDResName1>RDFileName1,..RDResNameN>RDFileNameN

     *Примечание*: при записи к имени ресурса добавляется приставка "\_IS\_".
     Поэтому, при вызове такого ресурса к его имени следует добавлять "\_IS\_".

     > *Пример*: TResourceStream.Create(HInstance, '_IS_MYFILE1', RT_RCDATA);

Практическое использование функций, компонентов и параметров расширенной версии смотрите в примерах сценариев (папка **Examples_ENVCL**).

### Установка

Создайте копию папки с установленной программой Inno Setup v6.0.5 (официальный релиз). Переименуйте копию папки в удобное и понятное название, например "Inno Setup 6 VCL". Скопируйте в эту папку ВСЕ перечисленные выше файлы и подтвердите их замену.

### Известные проблемы

Исправлено 16.02.2023

~~Некорректное отображением границы у компонента TRichEditViewer на пользовательских страницах в виде прозрачной окантовки вокруг элемента, под которой просматривается предыдущая или следующая страница инсталлятора. Для её устранения в секции \[Code\] компоненту TRichEditViewer необходимо добавить свойство BevelKind  со значением bkNone (при инициализации или изменении текущей страницы (процедура CurPageChanged)).~~


---
> Обновлено 02.06.2023
