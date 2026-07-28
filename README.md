 🌐 ترجمة هذه الصفحة تلقائي
 
[![English](https://img.shields.io/badge/Translate-English-blue?style=flat&logo=google-translate)](https://translate.google.com/translate?sl=auto&tl=en&u=https://raw.githubusercontent.com/bynabile/MySandboxTweaks/main/README.md)
[![中文](https://img.shields.io/badge/Translate-中文-red?style=flat&logo=google-translate)](https://translate.google.com/translate?sl=auto&tl=zh-CN&u=https://raw.githubusercontent.com/bynabile/MySandboxTweaks/main/README.md)
[![Español](https://img.shields.io/badge/Translate-Español-orange?style=flat&logo=google-translate)](https://translate.google.com/translate?sl=auto&tl=es&u=https://raw.githubusercontent.com/bynabile/MySandboxTweaks/main/README.md)
[![हिन्दी](https://img.shields.io/badge/Translate-हिन्दी-yellow?style=flat&logo=google-translate)](https://translate.google.com/translate?sl=auto&tl=hi&u=https://raw.githubusercontent.com/bynabile/MySandboxTweaks/main/README.md)
[![Português](https://img.shields.io/badge/Translate-Português-brightgreen?style=flat&logo=google-translate)](https://translate.google.com/translate?sl=auto&tl=pt&u=https://raw.githubusercontent.com/bynabile/MySandboxTweaks/main/README.md)
[![Русский](https://img.shields.io/badge/Translate-Русский-lightgrey?style=flat&logo=google-translate)](https://translate.google.com/translate?sl=auto&tl=ru&u=https://raw.githubusercontent.com/bynabile/MySandboxTweaks/main/README.md)
[![日本語](https://img.shields.io/badge/Translate-日本語-purple?style=flat&logo=google-translate)](https://translate.google.com/translate?sl=auto&tl=ja&u=https://raw.githubusercontent.com/bynabile/MySandboxTweaks/main/README.md)
[![Français](https://img.shields.io/badge/Translate-Français-darkblue?style=flat&logo=google-translate)](https://translate.google.com/translate?sl=auto&tl=fr&u=https://raw.githubusercontent.com/bynabile/MySandboxTweaks/main/README.md)
[![Deutsch](https://img.shields.io/badge/Translate-Deutsch-black?style=flat&logo=google-translate)](https://translate.google.com/translate?sl=auto&tl=de&u=https://raw.githubusercontent.com/bynabile/MySandboxTweaks/main/README.md)

---

# 🛡️ MySandboxTweaks – تخصيص متقدم لـ Windows Sandbox

أداة شاملة لتحويل بيئة Windows Sandbox الافتراضية إلى بيئة عمل خفيفة، مظلّمة، خالية من المشتتات، مع تشغيل تلقائي ذكي للتطبيقات والسكربتات.

---

## 📌 المقدمة
MySandboxTweaks عبارة عن مجموعة من الملفات تقوم بـ:

- إعداد Windows Sandbox تلقائياً بمجرد تشغيله.
- تطبيق عشرات التعديلات على الريجستري (أخبار، تأثيرات، مظهر داكن، أيقونات صغيرة...).
- تشغيل أي برامج أو سكربتات تضعها في مجلد `AutoRun` بشكل تلقائي، مع ظهور نوافذها على الشاشة.
- نسخ ملفات مخصصة إلى سطح المكتب.
- دعم خلفية مخصصة (`bg.jpg`).

---

## 🧰 مكونات الأداة

| الملف / المجلد | الوصف |
|----------------|--------|
| `sandbox.wsb` | ملف إعدادات Windows Sandbox (الذاكرة، الشبكة، المجلدات المشتركة، أمر بدء التشغيل). يمكن وضعه في **أي مكان** على جهازك (سطح المكتب مثلاً). |
| `setup.bat` | السكربت الرئيسي الذي ينفذ عند بدء الساندبوكس – يقوم بالتعديلات وتشغيل `AutoRun` بعد نسخه إلى مسار محلي آمن. |
| `tweaks.reg` | ملف ريجستري يحتوي تعديلات المظهر والسلوك. |
| `bg.jpg` | صورة الخلفية الجديدة (اختياري). |
| `AutoRun/` | مجلد تضع فيه أي ملفات تريد تشغيلها تلقائياً (`.exe`, `.bat`, `.ps1`, `.cmd`…). |
| `DesktopItems/` | ملفات تُنسخ تلقائياً إلى سطح المكتب داخل الساندبوكس (اختياري). |

---

## 📁 بنية المجلدات المطلوبة

### 1. المجلد الثابت `C:\MySandboxTweaks`
يجب أن يكون موجوداً على القرص `C:` ويحتوي على جميع ملفات التخصيص باستثناء ملف `.wsb`:

```
C:\MySandboxTweaks\
├── setup.bat
├── tweaks.reg
├── bg.jpg                   ← اختياري
├── AutoRun\                 ← اختياري (ضع داخله البرامج/السكربتات)
│   ├── برنامج.exe
│   └── myscript.bat
└── DesktopItems\            ← اختياري (ملفات ستظهر على سطح المكتب)
    └── مستند.pdf
```

### 2. ملف `sandbox.wsb`
يمكن وضعه في **أي مكان** تفضله (سطح المكتب، مجلد المستندات...).  
المهم أن يحتوي داخله على نفس مسار المجلد المضيف:
```xml
<HostFolder>C:\MySandboxTweaks</HostFolder>
```
وهو موجود بالفعل في الملف المرفق.  
بمجرد تشغيله (نقرة مزدوجة)، سيبحث الساندبوكس عن `C:\MySandboxTweaks\setup.bat` وينفذه.

---

## 🚀 طريقة الاستخدام

1. تأكد من أن Windows Sandbox مفعّل على جهازك (من ميزات Windows).
2. أنشئ المجلد `C:\MySandboxTweaks` وضع داخله الملفات المطلوبة (كما هو موضّح أعلاه).
3. ضع البرامج أو السكربتات التي تريد تشغيلها تلقائياً في `C:\MySandboxTweaks\AutoRun`.
4. شغّل الساندبوكس بفتح ملف `sandbox.wsb` (من أي مكان حفظته فيه).
5. انتظر لحظات حتى يكتمل تحميل سطح المكتب وتظهر التطبيقات التي أعددتها.

---

## ⚙️ ماذا يفعل `setup.bat` بالتفصيل؟

1. **استيراد ملف `tweaks.reg`** لتطبيق إعدادات الريجستري دفعة واحدة.
2. **فرض إيقاف الأخبار والاهتمامات** من شريط المهام عبر الريجستري والسياسات.
3. **إخفاء مربع البحث**.
4. **إيقاف التأثيرات الحركية والأنيميشن** مباشرةً عبر أوامر PowerShell و API لتحسين السرعة.
5. **تغيير خلفية سطح المكتب** إلى `bg.jpg` إذا وُجد.
6. **نسخ محتويات `DesktopItems`** إلى سطح مكتب المستخدم `WDAGUtilityAccount`.
7. **حذف مجلد `AutoRun` تلقائياً** إن ظهر على سطح المكتب بالخطأ.
8. **إعادة تشغيل `explorer.exe`** لتطبيق التغييرات فوراً.
9. **تجهيز وتشغيل محتويات `AutoRun` من مسار محلي**  
   - يتم أولاً **نسخ** جميع ملفات `AutoRun` من المسار المشترك (`C:\SandboxFiles\AutoRun`) إلى المسار المحلي المؤقت `C:\Users\WDAGUtilityAccount\AppData\Local\Temp\AutoRun` لتجاوز قيود أمان تشغيل الملفات من مسار الشبكة.  
   - بعد ذلك، تُشغّل الملفات تباعاً مع ضمان ظهورها في نوافذ مستقلة:
     - `.bat` / `.cmd` ← نافذة CMD مستقلة تبقى مفتوحة (`start cmd /k`)
     - `.ps1` ← نافذة PowerShell مستقلة مع سياسة Bypass وتبقى مفتوحة (`-NoExit`)
     - `.exe` وغيرها ← تشغيل مباشر مع نافذتها الرسومية

---

## 🔧 خيارات التخصيص

### إضافة برامج تشغيل تلقائي
ضع أي ملف تنفيذي أو سكربت في `C:\MySandboxTweaks\AutoRun`.  
الأنواع المدعومة:
- `.exe`, `.msi` ← تعمل مباشرة.
- `.bat`, `.cmd` ← تشغّل في نافذة CMD مستقلة وتبقى مفتوحة حتى تغلقها.
- `.ps1` ← تشغّل في نافذة PowerShell مستقلة مع سياسة `Bypass`.

### إضافة ملفات سطح المكتب
ضع ملفاتك في `C:\MySandboxTweaks\DesktopItems` وسيتم نسخها تلقائياً إلى سطح المكتب داخل الساندبوكس.

### تغيير الخلفية
استبدل الصورة `bg.jpg` بأي صورة تفضلها (يُفضل أن تكون بصيغة `.jpg` وموجودة في المجلد الرئيسي).

### تعديل الذاكرة أو الإعدادات
افتح ملف `sandbox.wsb` وعدّل القيم مثل:
```xml
<MemoryInMB>4096</MemoryInMB>       <!-- الذاكرة بالميغابايت -->
<Networking>Default</Networking>     <!-- أو Disable لمنع الإنترنت -->
<ClipboardRedirection>Default</ClipboardRedirection>  <!-- السماح بالنسخ واللصق -->
```

---

## ❓ الأسئلة الشائعة وحل المشكلات

**س: لماذا لا تعمل ملفات `AutoRun` رغم تعديل `setup.bat`؟**  
ج: الإصدار الحالي يقوم **بنسخ** مجلد `AutoRun` إلى مسار محلي مؤقت قبل التشغيل، مما يحل مشكلة منع تشغيل الملفات من مسار الشبكة. تأكد من أنك تستخدم آخر نسخة من `setup.bat` (الموجودة في هذا الدليل). إذا استمرت المشكلة، تحقق من عدم وجود أخطاء إملائية في اسم المجلد `AutoRun` ومن أن الملفات ليست تالفة.

**س: البرامج تظهر للحظة ثم تختفي!**  
ج: بالنسبة لسكربتات `.bat` و `.cmd`، يستخدم `setup.bat` الأمر `start cmd /k` الذي يبقي النافذة مفتوحة. إذا كنت تشغل برامج `.exe` وتختفي، فهذا سلوك البرنامج نفسه وليس له علاقة بالأداة.

**س: لا تظهر أيقونة `DesktopItems` على سطح المكتب.**  
ج: تأكد من أن الملفات موجودة في `C:\MySandboxTweaks\DesktopItems` وأن اسم المجلد صحيح. يمكنك أيضاً التحقق من ظهورها مباشرة في المسار `C:\Users\WDAGUtilityAccount\Desktop` داخل الساندبوكس.

**س: أريد إلغاء خلفية الشاشة.**  
ج: احذف ملف `bg.jpg` من `C:\MySandboxTweaks` أو علّق الأوامر الخاصة بالخلفية في `setup.bat`.

**س: هل يجب أن يكون ملف `sandbox.wsb` داخل `C:\MySandboxTweaks`؟**  
ج: لا، يمكنك وضعه في أي مكان (سطح المكتب مثلاً). المهم أن يظل المسار `<HostFolder>` يشير إلى `C:\MySandboxTweaks`.

---

## 📝 ملاحظات هامة

- تعمل الأداة على **Windows 10 Pro/Enterprise** و **Windows 11 Pro/Enterprise** حيث تتوفر ميزة Windows Sandbox.
- المستخدم داخل الساندبوكس هو `WDAGUtilityAccount` ولديه صلاحيات مسؤول.
- يتم تنظيف أي أثر لمجلد `AutoRun` على سطح المكتب بعد النسخ لضمان عدم إرباك المستخدم.
- كل التعديلات **مؤقتة**، وتختفي عند إغلاق جلسة الساندبوكس.
