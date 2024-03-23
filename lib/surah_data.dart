const Map<int, List> surahData = {
  1: [7, 'Al-Fatihah', 'The Opener'],
  2: [286, 'Al-Baqarah', 'The Cow'],
  3: [200, 'Ali \'Imran', 'Family of Imran'],
  4: [176, 'An-Nisa', 'The Women'],
  5: [120, 'Al-Ma\'idah', 'The Table Spread'],
  6: [165, 'Al-An\'am', 'The Cattle'],
  7: [206, 'Al-A\'raf', 'The Heights'],
  8: [75, 'Al-Anfal', 'The Spoils of War'],
  9: [129, 'At-Tawbah', 'The Repentance'],
  10: [109, 'Yunus', 'Jonah'],
  11: [123, 'Hud', 'Hud'],
  12: [111, 'Yusuf', 'Joseph'],
  13: [43, 'Ar-Ra\'d', 'The Thunder'],
  14: [52, 'Ibrahim', 'Abraham'],
  15: [99, 'Al-Hijr', 'The Rocky Tract'],
  16: [128, 'An-Nahl', 'The Bee'],
  17: [111, 'Al-Isra', 'The Night Journey'],
  18: [110, 'Al-Kahf', 'The Cave'],
  19: [98, 'Maryam', 'Mary'],
  20: [135, 'Taha', 'Ta-Ha'],
  21: [112, 'Al-Anbya', 'The Prophets'],
  22: [78, 'Al-Hajj', 'The Pilgrimage'],
  23: [118, 'Al-Mu\'minun', 'The Believers'],
  24: [64, 'An-Nur', 'The Light'],
  25: [77, 'Al-Furqan', 'The Criterion'],
  26: [227, 'Ash-Shu\'ara', 'The Poets'],
  27: [93, 'An-Naml', 'The Ant'],
  28: [88, 'Al-Qasas', 'The Stories'],
  29: [69, 'Al-\'Ankabut', 'The Spider'],
  30: [60, 'Ar-Rum', 'The Romans'],
  31: [34, 'Luqman', 'Luqman'],
  32: [30, 'As-Sajdah', 'The Prostration'],
  33: [73, 'Al-Ahzab', 'The Combined Forces'],
  34: [54, 'Saba', 'Sheba'],
  35: [45, 'Fatir', 'Originator'],
  36: [83, 'Ya-Sin', 'Ya Sin'],
  37: [182, 'As-Saffat', 'Those who set the Ranks'],
  38: [88, 'Sad', 'The Letter "Saad"'],
  39: [75, 'Az-Zumar', 'The Troops'],
  40: [85, 'Ghafir', 'The Forgiver'],
  41: [54, 'Fussilat', 'Explained in Detail'],
  42: [53, 'Ash-Shuraa', 'The Consultation'],
  43: [89, 'Az-Zukhruf', 'The Ornaments of Gold'],
  44: [59, 'Ad-Dukhan', 'The Smoke'],
  45: [37, 'Al-Jathiyah', 'The Crouching'],
  46: [35, 'Al-Ahqaf', 'The Wind-Curved Sandhills'],
  47: [38, 'Muhammad', 'Muhammad'],
  48: [29, 'Al-Fath', 'The Victory'],
  49: [18, 'Al-Hujurat', 'The Rooms'],
  50: [45, 'Qaf', 'The Letter "Qaf"'],
  51: [60, 'Adh-Dhariyat', 'The Winnowing Winds'],
  52: [49, 'At-Tur', 'The Mount'],
  53: [62, 'An-Najm', 'The Star'],
  54: [55, 'Al-Qamar', 'The Moon'],
  55: [78, 'Ar-Rahman', 'The Beneficent'],
  56: [96, 'Al-Waqi\'ah', 'The Inevitable'],
  57: [29, 'Al-Hadid', 'The Iron'],
  58: [22, 'Al-Mujadila', 'The Pleading Woman'],
  59: [24, 'Al-Hashr', 'The Exile'],
  60: [13, 'Al-Mumtahanah', 'She that is to be examined'],
  61: [14, 'As-Saf', 'The Ranks'],
  62: [11, 'Al-Jumu\'ah', 'The Congregation, Friday'],
  63: [11, 'Al-Munafiqun', 'The Hypocrites'],
  64: [18, 'At-Taghabun', 'The Mutual Disillusion'],
  65: [12, 'At-Talaq', 'The Divorce'],
  66: [12, 'At-Tahrim', 'The Prohibition'],
  67: [30, 'Al-Mulk', 'The Sovereignty'],
  68: [52, 'Al-Qalam', 'The Pen'],
  69: [52, 'Al-Haqqah', 'The Reality'],
  70: [44, 'Al-Ma\'arij', 'The Ascending Stairways'],
  71: [28, 'Nuh', 'Noah'],
  72: [28, 'Al-Jinn', 'The Jinn'],
  73: [20, 'Al-Muzzammil', 'The Enshrouded One'],
  74: [56, 'Al-Muddaththir', 'The Cloaked One'],
  75: [40, 'Al-Qiyamah', 'The Resurrection'],
  76: [31, 'Al-Insan', 'The Man'],
  77: [50, 'Al-Mursalat', 'The Emissaries'],
  78: [40, 'An-Naba', 'The Tidings'],
  79: [46, 'An-Nazi\'at', 'Those who drag forth'],
  80: [42, '\'Abasa', 'He Frowned'],
  81: [29, 'At-Takwir', 'The Overthrowing'],
  82: [19, 'Al-Infitar', 'The Cleaving'],
  83: [36, 'Al-Mutaffifin', 'The Defrauding'],
  84: [25, 'Al-Inshiqaq', 'The Sundering'],
  85: [22, 'Al-Buruj', 'The Mansions of the Stars'],
  86: [17, 'At-Tariq', 'The Nightcommer'],
  87: [19, 'Al-A\'la', 'The Most High'],
  88: [26, 'Al-Ghashiyah', 'The Overwhelming'],
  89: [30, 'Al-Fajr', 'The Dawn'],
  90: [20, 'Al-Balad', 'The City'],
  91: [15, 'Ash-Shams', 'The Sun'],
  92: [21, 'Al-Layl', 'The Night'],
  93: [11, 'Ad-Duhaa', 'The Morning Hours'],
  94: [8, 'Ash-Sharh', 'The Relief'],
  95: [8, 'At-Tin', 'The Fig'],
  96: [19, 'Al-\'Alaq', 'The Clot'],
  97: [5, 'Al-Qadr', 'The Power'],
  98: [8, 'Al-Bayyinah', 'The Clear Proof'],
  99: [8, 'Az-Zalzalah', 'The Earthquake'],
  100: [11, 'Al-\'Adiyat', 'The Courser'],
  101: [11, 'Al-Qari\'ah', 'The Calamity'],
  102: [8, 'At-Takathur', 'The Rivalry in world increase'],
  103: [3, 'Al-\'Asr', 'The Declining Day'],
  104: [9, 'Al-Humazah', 'The Traducer'],
  105: [5, 'Al-Fil', 'The Elephant'],
  106: [4, 'Quraysh', 'Quraysh'],
  107: [7, 'Al-Ma\'un', 'The Small kindnesses'],
  108: [3, 'Al-Kawthar', 'The Abundance'],
  109: [6, 'Al-Kafirun', 'The Disbelievers'],
  110: [3, 'An-Nasr', 'The Divine Support'],
  111: [5, 'Al-Masad', 'The Palm Fiber'],
  112: [4, 'Al-Ikhlas', 'The Sincerity'],
  113: [5, 'Al-Falaq', 'The Daybreak'],
  114: [6, 'An-Nas', 'Mankind'],
};
