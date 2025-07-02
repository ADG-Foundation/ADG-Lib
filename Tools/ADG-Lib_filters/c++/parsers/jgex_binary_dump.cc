// A standalone program that reads the binary content of a JGEX file
// and dumps its contents in a (somewhat) readable format


#include <iostream>
#include <fstream>
#include <cstdint>
#include <cstring>
#include <vector>
#include <locale>
#include <codecvt>


// read an integer from a binary file (big-endian assumed)
int32_t readInt(std::ifstream& in) {
  uint8_t buffer[4];
  in.read(reinterpret_cast<char*>(buffer), 4);

  if (in.gcount() != 4) {
    throw std::runtime_error("Failed to read 4 bytes for int");
  }

  int32_t result = 0;
  for (int i = 0; i < 4; ++i) {
    result = (result << 8) | buffer[i];
  }
  return result;
}

// read a boolean from a binary file
bool readBool(std::ifstream& in) {
    char byte;
    in.read(&byte, 1);

    if (in.gcount() != 1) {
        throw std::runtime_error("Failed to read 1 byte for boolean");
    }

    return byte != 0;
}


// read a big-endian 8-byte array to host-endian double
double readDouble(std::ifstream& in) {
    uint8_t buffer[8];
    in.read(reinterpret_cast<char*>(buffer), 8);

    if (in.gcount() != 8) {
        throw std::runtime_error("Failed to read 8 bytes for double");
    }

    uint64_t temp = 0;

    // Convert from big-endian to native endianness
    for (int i = 0; i < 8; ++i) {
        temp = (temp << 8) | buffer[i];
    }

    double result;
    std::memcpy(&result, &temp, sizeof(result)); // reinterpret as double
    return result;
}

// read a big-endian 4-byte array to host-endian float
double readFloat(std::ifstream& in) {
    uint8_t buffer[4];
    in.read(reinterpret_cast<char*>(buffer), 4);

    if (in.gcount() != 4) {
        throw std::runtime_error("Failed to read 4 bytes for float");
    }

    uint32_t temp = 0;

    // Convert from big-endian to native endianness
    for (int i = 0; i < 4; ++i) {
        temp = (temp << 8) | buffer[i];
    }

    float result;
    std::memcpy(&result, &temp, sizeof(result)); // reinterpret as float
    return result;
}


// read an ASCII string of the given length from a binary file
std::string readString(std::ifstream& in, std::size_t length) {
    std::string result(length, '\0');
    in.read(&result[0], length);

    if (in.gcount() != static_cast<std::streamsize>(length)) {
        throw std::runtime_error("Failed to read the full string of requested length");
    }

    return result;
}

// read a big-endian 2-byte char (UTF-16 code unit) from a binary file
char16_t readUnicodeChar(std::ifstream& in) {
    unsigned char bytes[2];
    in.read(reinterpret_cast<char*>(bytes), 2);
    if (!in) throw std::runtime_error("Failed to read char16");
    return (bytes[0] << 8) | bytes[1];
}

// convert UTF-16 string to UTF-8 std::string (C++11 and later)
std::string utf16_to_utf8(const std::u16string& utf16str) {
    // Use codecvt_utf8_utf16 to convert UTF-16 to UTF-8
    std::wstring_convert<std::codecvt_utf8_utf16<char16_t>, char16_t> convert;
    return convert.to_bytes(utf16str);
}

// reads a UTF-16 string consisting of UTF-16 chars (big-endian) from
// a binary file
std::string readUnicodeString(std::ifstream& in, int length) {
    std::u16string utf16str;
    utf16str.reserve(length);

    for (int i = 0; i < length; ++i) {
      char16_t ch = readUnicodeChar(in);
        utf16str.push_back(ch);
    }

    return utf16_to_utf8(utf16str);
}



////////////////////////////////////////////////////////////

class CMisc {
public:
  static double version_load_now;
  static int id_count;
  static bool footMarkShown;
  static double FOOT_MARK_LENGTH;
  

  static bool isFootMarkShown() {
    return footMarkShown;
  }
    
  static void Load(std::ifstream& in) {
    std::cout << "--- CMisc ---" << std::endl;
    bool nameTextShown = readBool(in);
    std::cout << "nameTextShown: " << std::boolalpha << nameTextShown << '\n';
    bool show_angle_text = readBool(in);
    std::cout << "show_angle_text: " << std::boolalpha << show_angle_text << '\n';
    int show_angle_type = readInt(in);
    std::cout << "show_angle_type: " << show_angle_type << '\n';
    int POINT_RADIUS = readInt(in);
    std::cout << "POINT_RADIUS: " << POINT_RADIUS << '\n';

    float alpha = readFloat(in);
    std::cout << "alpha: " << alpha << '\n';

    // setFillCompositeAlpha(alpha);

    int FLASH_MOVE_STEP = readInt(in);
    std::cout << "FLASH_MOVE_STEP: " << FLASH_MOVE_STEP << '\n';
    footMarkShown = readBool(in);
    std::cout << "footMarkShown: " << std::boolalpha << footMarkShown << '\n';
    FOOT_MARK_LENGTH = readInt(in);
    std::cout << "FOOТ_MARK_LENGTH : " << FOOT_MARK_LENGTH << '\n';
  }    
};

double CMisc::version_load_now;
int CMisc::id_count;
double CMisc::FOOT_MARK_LENGTH;
bool CMisc::footMarkShown;


class Color {
public:
    int r, g, b;

    Color(int r, int g, int b) : r(r), g(g), b(b) {}
};

std::vector<Color> color = {
    Color(0, 0, 255),       // Color.blue
    Color(0, 255, 255),

    Color(128, 0, 0),
    Color(255, 0, 0),       // Color.red

    Color(0, 128, 0),
    Color(0, 255, 0),       // Color.green
    Color(0, 128, 192),
    Color(128, 128, 255),
    Color(255, 0, 255),
    Color(255, 128, 0),
    Color(128, 128, 0),
    Color(255, 255, 0),
    Color(255, 165, 0),     // Color.orange
    Color(255, 255, 255),   // Color.white
    Color(192, 192, 192),   // Color.lightGray
    Color(128, 128, 128),   // Color.gray
    Color(0, 0, 0),         // Color.black
    Color(204, 255, 204),
    Color(255, 204, 204),
    Color(204, 204, 255),
    Color(204, 255, 255),
    Color(255, 204, 255),
    Color(255, 255, 204)
};
  


void drawData_Load(std::ifstream& in) {
  std::cout << "--- Draw data ---" << std::endl;
  int size = readInt(in);
  std::cout << "Size: " << size << std::endl;

  if (CMisc::version_load_now < 0.01) {
    std::cout << "version < 0.010" << std::endl;
    if (size > 11) {
      for (int i = 11; i < size; ++i) {
	int len = readInt(in);
	std::string name = readString(in, len);
	// dd->namelist.push_back(name); // if used
	int cv = readInt(in);
	// Color c(cv);
	// dd->colorlist.push_back(c);
      }
      // CCoBox_reGenerateAll();
    }
  } else {
    int cnum = color.size();
    int colorNumber = (CMisc::version_load_now >= 0.031) ? cnum : (cnum - 6);
    std::cout << "colorNumber: " << colorNumber << std::endl;
    if (size > colorNumber) {
      for (int i = colorNumber; i < size; ++i) {
	int cv = readInt(in);
	std::cout << "cv: " << cv << std::endl;
	// Color c(cv);
	// dd->colorlist.push_back(c);
      }
      // CCoBox_reGenerateAll();
    }
  }
}

void Load_global(std::ifstream& in) {
  std::cout << "--- Global ---" << '\n';
  if (CMisc::version_load_now < 0.010) {
    std::cout << "version < 0.010" << std::endl;
    int32_t size = readInt(in);
    std::cout << "Size: " << size << std::endl;;
    if (size > 100000) {
      return;
    }
    std::vector<uint8_t> s(size);
    in.read(reinterpret_cast<char*>(s.data()), size);
    if (in.gcount() != size) {
      throw std::runtime_error("Failed to read global byte array");
    }
    std::cout << "Bytes: ";
    for (uint8_t x : s)
      std::cout << x << " ";
    std::cout << std::endl;
  }

  drawData_Load(in);

  if (CMisc::version_load_now >= 0.030) {
    int UndoStruct_INDEX = readInt(in);
    std::cout << "UndoStruct Index: " << UndoStruct_INDEX << std::endl;
  }

  if (CMisc::version_load_now >= 0.040) {
    CMisc::Load(in);
  }

  // int footMarkShown = CMisc::isFootMarkShown(); // Applet-specific logic
  // int footMarkLength = CMisc::FOOT_MARK_LENGTH;
  std::cout << "------" << '\n';
}

struct Parameter {
  int type;
  int xindex;
  double value;
  bool Solved;
};
int paraCounter;
std::vector<Parameter> parameters;

const Parameter& getParameterByindex(double index) {
  for (int i = 0; i < paraCounter - 1; i++) {
    if (parameters[i].xindex == index) {
      return parameters[i];
    }
  }
  throw std::runtime_error("Unknown parameter index");
}

void Parameter_Load(std::ifstream& in, Parameter& p) {
  std::cout << "--- parameter ---" << '\n';
  p.type = readInt(in);
  std::cout << "type = " << p.type << std::endl;
  p.xindex = readInt(in);
  std::cout << "xindex = " << p.xindex << std::endl;
  p.value = readDouble(in);
  std::cout << "value = " << p.value << std::endl;
  p.Solved = readBool(in);
  std::cout << "Solved = " << std::boolalpha << p.Solved << std::endl;
  std::cout << "------" << std::endl;;
}

void CTrace_Load(std::ifstream& in) {
  // FIXME
}

void CClass_Load(std::ifstream& in) {
  int m_id = readInt(in);
  std::cout << "m_id: " << m_id << '\n';

  int size = readInt(in);
  // std::cout << "m_name size: " << size << '\n';
  std::string m_name = readUnicodeString(in, size);
  if (m_name == "")
    m_name = " ";
  std::cout << "m_name: " << m_name << '\n';

  int m_color = readInt(in);
  std::cout << "m_color: " << m_color << '\n';
  int m_dash = readInt(in);
  std::cout << "m_dash: " << m_dash << '\n';
  int m_width = readInt(in);
  std::cout << "m_width: " << m_width << '\n';
  if (CMisc::version_load_now >= 0.017) {
    bool visible = readBool(in);
    std::cout << "visible: " << std::boolalpha << visible << '\n';
  }
}

void DrawType_Load(std::ifstream& in) {
  int color_index = readInt(in);
  std::cout << "color_index: " << color_index << '\n';
  int dash = readInt(in);
  std::cout << "dash: " << dash << '\n';
  int width = readInt(in);
  std::cout << "width: " << width << '\n';
}


void CPoint_Load(std::ifstream& in) {
  std::cout << "--- CPoint ---" << std::endl;
  if (CMisc::version_load_now < 0.01) {
    std::cout << "version_load_now < 0.01" << std::endl;
    
    int m_id = readInt(in);
    std::cout << "m_id = " << m_id << "\n";

    int drawt_flag = readInt(in);
    std::cout << "drawt_flag = " << drawt_flag << "\n";

    if (drawt_flag == 0) {
      std::cout << "drawt = nullptr\n";
    } else {
      DrawType_Load(in);
    }

    int len = readInt(in);
    std::string m_name = readString(in, len);
    std::cout << "m_name = " << m_name << "\n";

    int type = readInt(in);
    std::cout << "type = " << type << "\n";

    int ix = readInt(in);
    std::cout << "ix = " << ix << "\n";
    double x1 = getParameterByindex(ix).value;
    std::cout << "x1 = " << x1 << "\n";

    int iy = readInt(in);
    std::cout << "iy = " << iy << "\n";
    double y1 = getParameterByindex(iy).value;
    std::cout << "y1 = " << y1 << "\n";

    int discarded = readInt(in);
    std::cout << "discarded OnCircleOrOnLine = " << discarded << "\n";

    int size = readInt(in);
    std::cout << "constraints size = " << size << "\n";

    // std::vector<void*> cons;
    for (int i = 0; i < size; i++) {
      int id = readInt(in);
      std::cout << "constraint id[" << i << "] = " << id << "\n";
      // cons.push_back(dp.getConstraintByid(id));
    }

    bool visible = readBool(in);
    std::cout << "visible = " << std::boolalpha << visible << "\n";

    // auto ptext = std::make_shared<CText>(nullptr, 5, -5, CText::NAME_TEXT);
    // dp.addObjectToList(ptext, dp.textlist);
  } else {
    CClass_Load(in);
    int type = readInt(in);
    std::cout << "type = " << type << "\n";

    int ix = readInt(in);
    std::cout << "ix = " << ix << "\n";
    double x1 = getParameterByindex(ix).value;
    std::cout << "x1 = " << x1 << "\n";

    int iy = readInt(in);
    std::cout << "iy = " << iy << "\n";
    double y1 = getParameterByindex(iy).value;
    std::cout << "y1 = " << y1 << "\n";

    int discarded = readInt(in);
    std::cout << "discarded OnCircleOrOnLine = " << discarded << "\n";

    int size = readInt(in);
    std::cout << "constraints size = " << size << "\n";

    for (int i = 0; i < size; i++) {
      int id = readInt(in);
      std::cout << "constraint id[" << i << "] = " << id << "\n";
      // void* cs = dp.getConstraintByid(id);
      // addcstoPoint(cs); // implement as needed
    }

    bool visible = readBool(in);
    std::cout << "visible = " << std::boolalpha << visible << "\n";

    bool hasSetColor = true;
    std::cout << "hasSetColor = " << std::boolalpha << hasSetColor << "\n";

    if (CMisc::version_load_now >= 0.043) {
      int m_radius = readInt(in);
      std::cout << "m_radius = " << m_radius << "\n";
    } else {
      int m_radius = -1;
      std::cout << "m_radius = " << m_radius << " (default)\n";
    }

    if (CMisc::version_load_now >= 0.050) {
      bool freezed = readBool(in);
      std::cout << "freezed = " << std::boolalpha << freezed << "\n";
    }
  }
  std::cout << "------" << std::endl;
}

void CLine_Load(std::ifstream& in) {
  std::cout << "--- CLine ---" << std::endl;
  std::string m_name;
  if (CMisc::version_load_now < 0.01) {
    std::cout << "version_load_now < 0.01" << std::endl;
    int m_id = readInt(in);
    std::cout << "m_id = " << m_id << "\n";

    DrawType_Load(in);

    // m_color = drawt.color_index;
    // if (m_color == 1) m_color = 3;
    // else if (m_color == 2) m_color = 5;
    // else if (m_color == 3) m_color = 11;
    // else if (m_color == 7) m_color = 8;
    // std::cout << "adjusted m_color = " << m_color << "\n";
    // m_dash = drawt.dash;
    // m_width = drawt.width;

    int nameSize = readInt(in);
    std::cout << "name length = " << nameSize << "\n";
    std::string m_name = readUnicodeString(in, nameSize);
    std::cout << "m_name = " << m_name << "\n";

    int type = readInt(in);
    std::cout << "type = " << type << "\n";

    int pointSize = readInt(in);
    std::cout << "point list size = " << pointSize << "\n";
    for (int i = 0; i < pointSize; ++i) {
      int id = readInt(in);
      std::cout << "point id[" << i << "] = " << id << "\n";
      // CPoint* p = dp.getPointById(id);
      // this.addApoint(p);  // Simulate here if needed
    }

    int constraintSize = readInt(in);
    std::cout << "constraint list size = " << constraintSize << "\n";

    int nc = 0;
    for (int i = 0; i < constraintSize; ++i) {
      int id = readInt(in);
      std::cout << "constraint id[" << i << "] = " << id << "\n";
      /*
      constraint* c = dp.getConstraintByid(id);
      if (!c) {
	++nc;
	std::cout << "  → null constraint\n";
      } else {
	cons.push_back(c);
	std::cout << "  → valid constraint\n";
      }
      */
    }
    // std::cout << "final constraint count = " << (constraintSize - nc) << "\n";
  } else {
    CClass_Load(in);
    int type = readInt(in);
    std::cout << "type = " << type << "\n";

    int ext_type = readInt(in);
    std::cout << "ext_type = " << ext_type << "\n";

    int pointSize = readInt(in);
    std::cout << "point list size = " << pointSize << "\n";
    for (int i = 0; i < pointSize; ++i) {
      int id = readInt(in);
      std::cout << "point id[" << i << "] = " << id << "\n";
      /*
      CPoint* tp = dp.getPointById(id);
      if (!tp) {
	std::cout << "  → null point\n";
      } else {
	// this.addApoint(tp);
	std::cout << "  → valid point\n";
      }
      */
    }

    int constraintSize = readInt(in);
    std::cout << "constraint list size = " << constraintSize << "\n";
    for (int i = 0; i < constraintSize; ++i) {
      int id = readInt(in);
      std::cout << "constraint id[" << i << "] = " << id << "\n";
      // cons.push_back(dp.getConstraintByid(id));
    }
  }

  if (CMisc::version_load_now >= 0.045) {
    int extent = readInt(in);
    std::cout << "extent = " << extent << "\n";
  }
  std::cout << "------" << std::endl;
}


void Circle_Load(std::ifstream& in) {
  std::cout << "--- Circle ---" << std::endl;
  if (CMisc::version_load_now < 0.010) {
    std::cout << "version_load_now < 0.01" << std::endl;
    int m_id = readInt(in);

    DrawType_Load(in);
    /*
    m_color = drawt.color_index;
    {
      if (m_color == 1)
	m_color = 3;
      else if (m_color == 2)
	m_color = 5;
      else if (m_color == 3)
	m_color = 11;
      else if (m_color == 7)
	m_color = 8;
    }
    m_dash = drawt.dash;
    m_width = drawt.width;
    */

    int type = readInt(in);
    int size = readInt(in);
    std::string m_name = readUnicodeString(in, size);
    int d = readInt(in);
    // o = dp.getPointById(d);

    size = readInt(in);
    for (int i = 0; i < size; i++) {
      int dx = readInt(in);
      // points.add(dp.getPointById(dx));
    }
    size = readInt(in);
    for (int i = 0; i < size; i++) {
      int dx = readInt(in);
      // cons.add(dp.getConstraintByid(dx));
    }
  } else {
    CClass_Load(in);
    int type = readInt(in);
    std::cout << "type: " << type << '\n';
    int d = readInt(in);
    std::cout << "d: " << d << '\n';
    // o = dp.getPointById(d);

    int size = readInt(in);
    std::cout << "Points size: " << size << '\n';
    for (int i = 0; i < size; i++) {
      int dx = readInt(in);
      std::cout << "Point index: " << dx << '\n';
      // points.add(dp.getPointById(dx));
    }
    size = readInt(in);
    std::cout << "Constraints size: " << size << '\n';
    for (int i = 0; i < size; i++) {
      int dx = readInt(in);
      std::cout << "Constraints index: " << dx << '\n';
      // cons.add(dp.getConstraintByid(dx));
    }
  }
  std::cout << "------" << std::endl;
}

void CAngle_Load(std::ifstream& in) {
  std::cout << "--- CAngle ---" << std::endl;
  if (CMisc::version_load_now < 0.01) {
    std::cout << "version_load_now < 0.01" << std::endl;
    int m_id = readInt(in);
    int dx = readInt(in);
    // lstart = dp.getLineByid(dx);
    int dy = readInt(in);
    // lend = dp.getLineByid(dy);
    int radius = readInt(in);

    int px = readInt(in);
    // pstart = dp.getPointById(px);
    int py = readInt(in);
    //     pend = dp.getPointById(py);

    DrawType_Load(in);

    /*
    m_color = drawt.color_index;
    if (m_color == 1)
      m_color = 3;
    m_dash = drawt.dash;
    m_width = drawt.width;
    */
  } else {
    CClass_Load(in);
    int dx = readInt(in);
    std::cout << "dx: " << dx << '\n';
    // lstart = dp.getLineByid(dx);
    int dy = readInt(in);
    std::cout << "dy: " << dy << '\n';
    // lend = dp.getLineByid(dy);
    int px = readInt(in);
    std::cout << "px: " << px << '\n';
    // pstart = dp.getPointById(px);
    int py = readInt(in);
    std::cout << "py: " << py << '\n';
    // pend = dp.getPointById(py);
    int radius = readInt(in);
    if (CMisc::version_load_now >= 0.042) {
      int show_type = readInt(in);
      std::cout << "show_type: " << show_type << '\n';
      int ftype = readInt(in);
      std::cout << "ftype: " << ftype << '\n';
      int value1 = readInt(in);
      std::cout << "value1: " << value1 << '\n';
    }
  }
  std::cout << "------" << std::endl;
}

void CText_Load(std::ifstream& in) {
  std::cout << "--- CText ---" << std::endl;
  if (CMisc::version_load_now < 0.010) {
    std::cout << "version_load_now < 0.010" << std::endl;
    int m_id = readInt(in);
    int x = readInt(in);
    int y = readInt(in);
    int size = readInt(in);
    std::string s = readString(in, size);
    if (CMisc::version_load_now >= 0.005) {
      std::cout << "version_load_now >= 0.005" << std::endl;
      int n = readInt(in);
      std::string str = readString(in, n);
      int type = readInt(in);
      int sz = readInt(in);
      int rgb = readInt(in);

      // font = new Font(name, type, sz);

      /*
      if (CMisc.version_load_now == 0.006) {
	if (rgb <= 0)
	  m_color = drawData.getColorIndex(Color.black);
	else
	  m_color = rgb;
      } else {
	if (rgb < 0)
	  m_color = drawData.getColorIndex(Color.black);
	else {
	  if (rgb == 9)
	    m_color = drawData.getColorIndex(Color.black);
	  else
	    m_color = (rgb);
	}
      }
      */
    }

    /*
    {
      if (m_color == 1)
	m_color = 3;
      else if (m_color == 2)
	m_color = 5;
      else if (m_color == 3)
	m_color = 11;
      else if (m_color == 7)
	m_color = 8;
    }
    */
  } else {
    CClass_Load(in);
    int type = readInt(in);
    std::cout << "type: " << type << '\n';
    int x = readInt(in);
    std::cout << "x: " << x << '\n';
    int y = readInt(in);
    std::cout << "y: " << y << '\n';

    int n = readInt(in);
    std::string name = readString(in, n);
    std::cout << "font name: " << name << '\n';

    int font_type = readInt(in);
    std::cout << "font type: " << font_type << '\n';
    
    int sz = readInt(in);
    std::cout << "font size: " << sz << '\n';

    int NORMAL_TEXT = 0;
    int NAME_TEXT = 1;
    int CNAME_TEXT = 2;
    int VALUE_TEXT = 3;
    
    // font = new Font(name, font_type, sz);

    if (type == NORMAL_TEXT) {
      int size = readInt(in);
      std::string str = readString(in, size);
      std::cout << "str: " << str << '\n';
    } else if (type == NAME_TEXT) {
      int id = readInt(in);
      std::cout << "point id: " << id << '\n';
      // CPoint p = dp.getPointById(id);
      // p.ptext = this;
      // father = p;
    } else if (type == CNAME_TEXT) {
      int size = readInt(in);
      std::string str = readString(in, size);
      int id = readInt(in);
      std::cout << "angle id: " << id << '\n';
      // CAngle ag = dp.getAngleByid(id);
      // ag.ptext = this;
      // father = ag;
    } else if (type == VALUE_TEXT) {
      int size = readInt(in);
      std::string str = readString(in, size);

      /*
      tvalue = CTextValue.parseString(str);
      if (tvalue == null)
	tvalue = new CTextValue();
      */
      
      if (CMisc::version_load_now >= 0.052) {
	int id = readInt(in);
	std::cout << "father id: " << id << '\n';
	// father = dp.getOjbectById(id);
      }
    }
  }
  std::cout << "------" << std::endl;
}

void CTMark_Load(std::ifstream& in) {
  CClass_Load(in);
  int d = readInt(in);
  std::cout << "d ln1: " << d << '\n';
  // ln1 = dp.getLineByid(d);
  d = readInt(in);
  std::cout << "d ln2: " << d << '\n';
  // ln2 = dp.getLineByid(d);

  int length;
  if (CMisc::version_load_now >= 0.053)
    length = readInt(in);
  else
    length = -1;
  std::cout << "length: " << length << '\n';
}

void Arrow_Load(std::ifstream& in) {
  CClass_Load(in);
  int p_start = readInt(in);
  std::cout << "p_start: " << p_start << '\n';
  // st = dp.getPointById(p_start);
  int p_end = readInt(in);
  std::cout << "p_end: " << p_end << '\n';
  // ed = dp.getPointById(p_end);
  int angle = readInt(in);
  std::cout << "angle: " << angle << '\n';
  int length = readInt(in);
  std::cout << "length: " << length << '\n';
}

void Cedmark_Load(std::ifstream& in) {
  CClass_Load(in);
  int id = readInt(in);
  std::cout << "id1: " << id << '\n';
  // p1 = dp.getPointById(id);
  id = readInt(in);
  std::cout << "id2: " << id << '\n';
  // p2 = dp.getPointById(id);
  
  int length = readInt(in);
  std::cout << "length: " << length << '\n';
  
  int dnum = readInt(in);
  std::cout << "dnum: " << dnum << '\n';
}

void Constraint_Load(std::ifstream& in) {
  std::cout << "--- Constraint ---" << '\n';
  int id = readInt(in);
  std::cout << "id: " << id << '\n';
  
  int ConstraintType = readInt(in);
  std::cout << "ConstraintType: " << ConstraintType << '\n';

  int size = readInt(in);
  std::cout << "size: " << size << '\n';
  for (int i = 0; i < size; i++) {
    int t = readInt(in);
    int d = readInt(in);

    std::cout << "t, d: " << t << ", " << d << '\n';

    switch (t) {
    case 1: {
      // CPoint p = dp.getPointById(d);
      // elementlist.add(p);
    }
      break;
    case 2:
      // elementlist.add(dp.getLineByid(d));
      break;
    case 3:
      // elementlist.add(dp.getCircleByid(d));
      break;
    case 4:
      // elementlist.add(dp.getOjbectById(d));
      break;
    case 5:
      // elementlist.add(dp.getAngleByid(d));
      break;
    case 6:
      // elementlist.add(dp.getParameterByindex(d));
      break;
    case 7:
      // elementlist.add(dp.getOjbectById(d));
      break;
    case 20:
      // elementlist.add(new Integer(d));
      break;
    default:
      // elementlist.add(dp.getOjbectById(d));
      break;
    }
  }
  int proportion = readInt(in);
  std::cout << "proportion: " << proportion << '\n';
  
  bool is_poly_generate = readBool(in);
  std::cout << "is_poly_generate: " << std::boolalpha << is_poly_generate << '\n';
  
  if (CMisc::version_load_now <= 0.032) {
    std::cout << "version_load_now <= 0.032" << '\n';
    if (ConstraintType == 16) {
      // this.ConstraintType = NSQUARE;
      // elementlist.remove(1);
    }
  }
  std::cout << "------" << std::endl;
}

void ReadList(std::ifstream& in) {
  int size = readInt(in);
  std::cout << "list size: " << size << '\n';
  for (int i = 0; i < size; i++) {
    int id = readInt(in);
    /*
    Object obj = dp.getOjbectById(id);
    if (obj != null) {
      v.add(obj);
    }
    */
    std::cout << "id: " << id << '\n';
  }
  // return v;  
}

void UndoStruct_Load(std::ifstream& in) {
  std::cout << "--- Undo Struct ---" << std::endl;
  int m_id;
  if (CMisc::version_load_now >= 0.019) {
    m_id = readInt(in);
  } else {
    m_id = CMisc::id_count++;
  }
  std::cout << "m_id: " << m_id << '\n';

  if (CMisc::version_load_now >= 0.015) {
    int m_type = readInt(in);
    std::cout << "m_type: " << m_type << '\n';
  }
  
  if (CMisc::version_load_now > 0.01) {
    bool done = readBool(in);
    std::cout << "done: " << std::boolalpha << done << '\n';
    bool flash = readBool(in);
    std::cout << "flash: " << std::boolalpha << done << '\n';
    int action = readInt(in);
    std::cout << "action: " << action << '\n';
  }

  if (CMisc::version_load_now < 0.01) {
    int size = readInt(in);
    std::string str = readString(in, size);
    std::cout << "str: " << str << '\n';
  }
  
  int id = readInt(in);
  std::cout << "id: " << id << '\n';
  int current_id = readInt(in);
  std::cout << "current_id: " << current_id << '\n';
  int paraCounter = readInt(in);
  std::cout << "paraCounter: " << paraCounter << '\n';
  int pnameCounter = readInt(in);
  std::cout << "pnameCounter: " << pnameCounter << '\n';
  int plineCounter = readInt(in);
  std::cout << "plineCounter: " << plineCounter << '\n';
  int pcircleCounter = readInt(in);
  std::cout << "pcircleCounter: " << pcircleCounter << '\n';
  

  // for 0.01
  if (CMisc::version_load_now > 0.010) {
    int size = readInt(in);
    if (size > 0) {
      std::string msg = readString(in, size);
      std::cout << "msg: " << msg << '\n';
    }
  }

  int id_b = readInt(in);
  std::cout << "id_b: " << id_b << '\n';
  int paraCounter_b = readInt(in);
  std::cout << "paraCounter_b: " << paraCounter_b << '\n';
  int pnameCounter_b = readInt(in);
  std::cout << "pnameCounter_b: " << pnameCounter_b << '\n';
  int plineCounter_b = readInt(in);
  std::cout << "plineCounter_b: " << plineCounter_b << '\n';
  int pcircleCounter_b = readInt(in);
  std::cout << "pcircleCounter_b: " << pcircleCounter_b << '\n';
  
  if (CMisc::version_load_now >= 0.016) {
    // objectlist.addAll(this.ReadList(in, dp));
    ReadList(in);
  }

  if (CMisc::version_load_now >= 0.012) {
    int size = readInt(in);
    std::cout << "Child size: " << size << '\n';
    for (int i = 0; i < size; i++) {
      // UndoStruct u = new UndoStruct(-1, -1);
      // u.Load(in, dp);
      // childundolist.add(u);
      UndoStruct_Load(in);
    }
    
    // if (m_type == T_UNDO_NODE && childundolist.size() > 0) {
    // m_type = T_COMBINED_NODE;
    // }
  }
  std::cout << "------" << std::endl;
}

void AnimateC_Load(std::ifstream& in) {
  // FIXME
}

void CProveField_Load(std::ifstream& in) {
  // FIXME
}

bool Load(std::ifstream& in) {
  std::string title = readString(in, 2);
  if (title != "GE") return false;
  std::cout << "Title: " << title << '\n';

  double version = readDouble(in);
  std::cout << "Version: " << version << '\n';
  CMisc::version_load_now = version;

  if (version < 0.006) {
    std::cerr << "Error version " << std::to_string(version) << '\n';
    return false;
  }

  Load_global(in);

  int idcount = CMisc::id_count = readInt(in);
  std::cout << "idcount = " << idcount << std::endl;
  
  // poly.clearZeroN();

  int GridX = readInt(in);
  std::cout << "GridX = " << GridX << std::endl;

  int GridY = readInt(in);
  std::cout << "GridY = " << GridY << std::endl;

  bool DRAWGRID = readBool(in);
  std::cout << "DRAWGRID = " << std::boolalpha << DRAWGRID << std::endl;

  bool SNAP = readBool(in);
  std::cout << "SNAP = " << std::boolalpha << SNAP << std::endl;

  int CurrentAction = readInt(in);
  std::cout << "CurrentAction = " << CurrentAction << std::endl;

  int pnameCounter = readInt(in);
  std::cout << "pnameCounter = " << pnameCounter << std::endl;

  int plineCounter = readInt(in);
  std::cout << "plineCounter = " << plineCounter << std::endl;

  int pcircleCounter = readInt(in);
  std::cout << "pcircleCounter = " << pcircleCounter << std::endl;

  paraCounter = readInt(in);
  std::cout << "paraCounter = " << paraCounter << std::endl;

  parameters.resize(paraCounter - 1);
  for (int i = 0; i < paraCounter - 1; ++i) {
    Parameter_Load(in, parameters[i]);
  }
  
  // paraBackup.resize(paraCounter - 1);
  for (int i = 0; i < paraCounter - 1; ++i) {
    // paraBackup[i] = readDouble(in);
    double paraBackupI = readDouble(in);
    std::cout << "paraBackup[" << i << "]: " << paraBackupI << std::endl;
  }

  int size;
  if (CMisc::version_load_now < 0.01) {
    std::cout << "version_load_now < 0.01" << std::endl;
    size = readInt(in);
    int trackCounter = size;
    if (CMisc::version_load_now >= 0.008) {
      std::cout << "version_load_now >= 0.008" << std::endl;
      for (int i = 0; i < 2 * trackCounter; i++) {
	readInt(in);
      }
    } else {
      std::cout << "version_load_now < 0.008" << std::endl;
      for (int i = 0; i < trackCounter; i++) {
	readInt(in);
      }
    }
  } else if (CMisc::version_load_now < 0.012) {
    std::cout << "version_load_now < 0.012" << std::endl;
    size = readInt(in);
    for (int i = 0; i < size; i++) {
      // CTrace ct = new CTrace(null);
      // ct.Load(in, this);
      // tracelist.add(ct);
      CTrace_Load(in);
    }
  }

  size = readInt(in);
  std::cout << "Constraint size: " << size << '\n';
  for (int i = 0; i < size; i++) {
    int d = readInt(in);
    std::cout << "Constraint: " << d << '\n';
    // addConstraintToList(new constraint(d));
  }  

  size = readInt(in);
  std::cout << "Point size: " << size << '\n';
  for (int i = 0; i < size; i++) {
    CPoint_Load(in);
    // CPoint p = new CPoint();
    // p.Load(in, this);
    // pointlist.add(p);
  }

  size = readInt(in);
  std::cout << "Line size: " << size << '\n';
  for (int i = 0; i < size; i++) {
    // CLine ln = new CLine(0);
    // ln.Load(in, this);
    // linelist.add(ln);
    CLine_Load(in);
  }  

  size = readInt(in);
  std::cout << "Circle size: " << size << '\n';
  for (int i = 0; i < size; i++) {
    // Circle c = new Circle();
    // c.Load(in, this);
    // circlelist.add(c);
    Circle_Load(in);
  }

  size = readInt(in);
  std::cout << "Angle size: " << size << '\n';
  for (int i = 0; i < size; i++) {
    // CAngle ag = new CAngle();
    // ag.Load(in, this);
    // anglelist.add(ag);
    CAngle_Load(in);
  }
  
  size = readInt(in);
  std::cout << "Distance size: " << size << '\n';
  for (int i = 0; i < size; i++) {
    // CDistance dis = new CDistance();
    // dis.Load(in, this);
    // distancelist.add(dis);

    // FIXME
    // CDistance_Load(in);
  }
  
  size = readInt(in);
  std::cout << "Polygon size: " << size << '\n';
  for (int i = 0; i < size; i++) {
    // CPolygon poly = new CPolygon();
    // poly.Load(in, this);
    // addPolygonToList(poly);

    // FIXME
    // Polygon_Load(in);
  }
    
  size = readInt(in);
  std::cout << "Text size: " << size << '\n';
  for (int i = 0; i < size; i++) {
    // CText ct = new CText();
    // ct.Load(in, this);
    // textlist.add(ct);

    CText_Load(in);
  }

  if (CMisc::version_load_now >= 0.012) {
    size = readInt(in);
    std::cout << "Trace size: " << size << '\n';
    for (int i = 0; i < size; i++) {
      // CTrace ct = new CTrace(null);
      // ct.Load(in, this);
      // tracelist.add(ct);
      
      // FIXME
      // CTrace_Load(in);
    }
  }

  if (CMisc::version_load_now >= 0.017) {
    size = readInt(in);
    std::cout << "Mark size: " << size << '\n';
    
    if (CMisc::version_load_now <= 0.040) {
      std::cout << "version_load_now <= 0.040" << '\n';
      for (int i = 0; i < size; i++) {
	// Cedmark ce = new Cedmark();
	// ce.Load(in, this);
	// otherlist.add(ce);


	// FIXME
	// Cedmark_Load(in);
      }
    } else {
      for (int i = 0; i < size; i++) {
	int t = readInt(in);
	std::cout << "t: " << t << '\n';

	const int EQMARK = 11;
	const int TMARK = 12;
	const int ARROW = 13;
	
	switch (t) {
	case TMARK: {
	  std::cout << "TMARK" << '\n';
	  // CTMark mt = new CTMark();
	  // mt.Load(in, this);
	  // otherlist.add(mt);
	  CTMark_Load(in);
	}
	  break;
	case ARROW: {
	  std::cout << "ARROW" << '\n';
	  // CArrow ar = new CArrow(null, null);
	  // ar.Load(in, this);
	  // otherlist.add(ar);
	  Arrow_Load(in);
	  break;
	}
	case EQMARK:
	case 0: {
	  // Cedmark ce = new Cedmark();
	  // ce.Load(in, this);
	  // otherlist.add(ce);
	  Cedmark_Load(in);
	}
	  break;
	default:
	  std::cerr << "Mark unidentified!" << std::endl;
	  break;
	}
      }
    }
    std::cout << "------" << std::endl;
  }
  
  // this.optmizePolynomial();

  size = readInt(in);
  std::cout << "Constraint size: " << size << '\n';
  for (int i = 0; i < size; i++) {
    // constraint cs = (constraint) constraintlist.get(i);
    Constraint_Load(in);
    /*
      if (cs.is_poly_genereate) {
      cs.PolyGenerate();
      this.charsetAndAddPoly(true);
      }
    */
  }


  size = readInt(in);
  std::cout << "Undo size: " << size << '\n';
  for (int i = 0; i < size; i++) {
    // UndoStruct ud = new UndoStruct(0);
    // ud.Load(in, this);
    // undolist.add(ud);
    // if (ud.m_type == UndoStruct.T_TO_PROVE_NODE) {
    // drawData.setProveStatus();
    // }
    UndoStruct_Load(in);
  }

  // currentUndo = new UndoStruct(0);
  // currentUndo.Load(in, this);
  UndoStruct_Load(in);
  

  if (version >= 0.006) {
    int ti = readInt(in);
    std::cout << "ti: " << ti << '\n';
  }

  if (CMisc::version_load_now >= 0.009) { //version 0.009 special for web saver.
    bool isrun = readBool(in);
    std::cout << "isrun: " << std::boolalpha << isrun << '\n';
    if (isrun) {
      // this.animate = new AnimateC();
      // this.animate.Load(in, this);
      // if (gxInstance != null) {
      // {
      // gxInstance.anButton.setEnabled(true);
      // gxInstance.getAnimateDialog().setAttribute(animate);
      // gxInstance.showAnimatePane();
      // }
      // }
      AnimateC_Load(in);
    } else {
      // if (gxInstance != null) {
      // {
      // gxInstance.anButton.setEnabled(false);
      // }
      // }
    }
  }

  if (CMisc::version_load_now >= 0.017) {
      bool havep = readBool(in);
      std::cout << "havep: " << std::boolalpha << havep << '\n';
      if (havep) {
	// cpfield = new CProveField();
	// cpfield.Load(in, this);
	CProveField_Load(in);
	//                if (gxInstance != null) {
	//                    gxInstance.showProveBar(true);
	//                }
      }
  }
  
  /*
    CMisc.id_count = idcount;
    CurrentAction = MOVE;
    currentUndo.id = idcount;
    setSavedTag();
  */
  return true;
}

int main() {
  std::ifstream in("test.gex", std::ios::binary);
  if (!in) {
    std::cerr << "Failed to open file.\n";
    return 1;
  }

  try {
    Load(in);
  } catch (const std::exception& e) {
    std::cerr << "Error: " << e.what() << "\n";
  }

  return 0;
}
