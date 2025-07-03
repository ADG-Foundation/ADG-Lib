#include "driver_jgex_binary.hh"

#include <iostream>
#include <fstream>
#include <cstdint>
#include <cstring>  // for memcpy
#include <vector>
#include <locale>
#include <codecvt>
#include <regex>


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

bool readBool(std::ifstream& in) {
    char byte;
    in.read(&byte, 1);

    if (in.gcount() != 1) {
        throw std::runtime_error("Failed to read 1 byte for boolean");
    }

    return byte != 0;
}


// Convert big-endian 8-byte array to host-endian double
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

// Convert big-endian 4-byte array to host-endian float
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


std::string readString(std::ifstream& in, std::size_t length) {
    std::string result(length, '\0');
    in.read(&result[0], length);

    if (in.gcount() != static_cast<std::streamsize>(length)) {
        throw std::runtime_error("Failed to read the full string of requested length");
    }

    return result;
}

// Helper to read big-endian 2-byte char (UTF-16 code unit)
char16_t readUnicodeChar(std::ifstream& in) {
    unsigned char bytes[2];
    in.read(reinterpret_cast<char*>(bytes), 2);
    if (!in) throw std::runtime_error("Failed to read char16");
    return (bytes[0] << 8) | bytes[1];
}

// Convert UTF-16 string to UTF-8 std::string (C++11 and later)
std::string utf16_to_utf8(const std::u16string& utf16str) {
    // Use codecvt_utf8_utf16 to convert UTF-16 to UTF-8
    std::wstring_convert<std::codecvt_utf8_utf16<char16_t>, char16_t> convert;
    return convert.to_bytes(utf16str);
}

// Reads a Java UTF-16 string consisting of UTF-16 chars (big-endian)
std::string readUnicodeString(std::ifstream& in, int length) {
    std::u16string utf16str;
    utf16str.reserve(length);

    for (int i = 0; i < length; ++i) {
      char16_t ch = readUnicodeChar(in);
        utf16str.push_back(ch);
    }

    return utf16_to_utf8(utf16str);
}

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
    bool nameTextShown = readBool(in);
    bool show_angle_text = readBool(in);
    int show_angle_type = readInt(in);
    int POINT_RADIUS = readInt(in);

    float alpha = readFloat(in);
    int FLASH_MOVE_STEP = readInt(in);
    footMarkShown = readBool(in);
    FOOT_MARK_LENGTH = readInt(in);
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
  
void driver_jgex_binary::drawData_Load(std::ifstream& in) {
  int size = readInt(in);
  if (CMisc::version_load_now < 0.01) {
    if (size > 11) {
      for (int i = 11; i < size; ++i) {
	int len = readInt(in);
	std::string name = readString(in, len);
	int cv = readInt(in);
      }
    }
  } else {
    int cnum = color.size();
    int colorNumber = (CMisc::version_load_now >= 0.031) ? cnum : (cnum - 6);
    if (size > colorNumber) {
      for (int i = colorNumber; i < size; ++i) {
	int cv = readInt(in);
      }
    }
  }
}

void driver_jgex_binary::Load_global(std::ifstream& in) {
  if (CMisc::version_load_now < 0.010) {
    int32_t size = readInt(in);
    if (size > 100000) {
      return;
    }
    std::vector<uint8_t> s(size);
    in.read(reinterpret_cast<char*>(s.data()), size);
    if (in.gcount() != size) {
      throw std::runtime_error("Failed to read global byte array");
    }
  }

  drawData_Load(in);

  if (CMisc::version_load_now >= 0.030) {
    int UndoStruct_INDEX = readInt(in);
  }

  if (CMisc::version_load_now >= 0.040) {
    CMisc::Load(in);
  }
}


const Parameter& driver_jgex_binary::getParameterByindex(double index) {
  for (int i = 0; i < paraCounter - 1; i++) {
    if (parameters[i].xindex == index) {
      return parameters[i];
    }
  }
  throw std::runtime_error("Unknown parameter index");
}

void driver_jgex_binary::Parameter_Load(std::ifstream& in, Parameter& p) {
  p.type = readInt(in);
  p.xindex = readInt(in);
  p.value = readDouble(in);
  p.Solved = readBool(in);
}

void driver_jgex_binary::CTrace_Load(std::ifstream& in) {
  // FIXME
}

void driver_jgex_binary::CClass_Load(std::ifstream& in, CClass& c) {
  c.m_id = readInt(in);

  int size = readInt(in);
  c.m_name = readUnicodeString(in, size);
  if (c.m_name == "")
    c.m_name = " ";

  c.m_color = readInt(in);
  c.m_dash = readInt(in);
  c.m_width = readInt(in);
  if (CMisc::version_load_now >= 0.017) {
    c.visible = readBool(in);
  }
}

void driver_jgex_binary::DrawType_Load(std::ifstream& in) {
  int color_index = readInt(in);
  int dash = readInt(in);
  int width = readInt(in);
}


void driver_jgex_binary::CPoint_Load(std::ifstream& in) {
  if (CMisc::version_load_now < 0.01) {
    int m_id = readInt(in);
    int drawt_flag = readInt(in);

    if (drawt_flag == 0) {
    } else {
      DrawType_Load(in);
    }

    int len = readInt(in);
    std::string m_name = readString(in, len);
    int type = readInt(in);
    int ix = readInt(in);
    double x1 = getParameterByindex(ix).value;

    int iy = readInt(in);
    double y1 = getParameterByindex(iy).value;

    int discarded = readInt(in);

    int size = readInt(in);

    for (int i = 0; i < size; i++) {
      int id = readInt(in);
    }

    bool visible = readBool(in);
  } else {
    CClass c;
    CClass_Load(in, c);
    int type = readInt(in);

    int ix = readInt(in);
    double x1 = getParameterByindex(ix).value;

    int iy = readInt(in);
    double y1 = getParameterByindex(iy).value;

    points.emplace(c.m_name, Coords(x1, y1));
    
    int discarded = readInt(in);

    int size = readInt(in);

    for (int i = 0; i < size; i++) {
      int id = readInt(in);
    }

    bool visible = readBool(in);
    bool hasSetColor = true;

    if (CMisc::version_load_now >= 0.043) {
      int m_radius = readInt(in);
    } else {
      int m_radius = -1;
    }

    if (CMisc::version_load_now >= 0.050) {
      bool freezed = readBool(in);
    }
  }
}

void driver_jgex_binary::CLine_Load(std::ifstream& in) {
  std::string m_name;
  if (CMisc::version_load_now < 0.01) {
    int m_id = readInt(in);
    DrawType_Load(in);
    int nameSize = readInt(in);
    std::string m_name = readUnicodeString(in, nameSize);

    int type = readInt(in);

    int pointSize = readInt(in);
    for (int i = 0; i < pointSize; ++i) {
      int id = readInt(in);
    }

    int constraintSize = readInt(in);

    int nc = 0;
    for (int i = 0; i < constraintSize; ++i) {
      int id = readInt(in);
    }
  } else {
    CClass c;
    CClass_Load(in, c);
    int type = readInt(in);

    int ext_type = readInt(in);
    int pointSize = readInt(in);
    for (int i = 0; i < pointSize; ++i) {
      int id = readInt(in);
    }

    int constraintSize = readInt(in);
    for (int i = 0; i < constraintSize; ++i) {
      int id = readInt(in);
    }
  }

  if (CMisc::version_load_now >= 0.045) {
    int extent = readInt(in);
  }
}


void driver_jgex_binary::Circle_Load(std::ifstream& in) {
  if (CMisc::version_load_now < 0.010) {
    int m_id = readInt(in);

    DrawType_Load(in);

    int type = readInt(in);
    int size = readInt(in);
    std::string m_name = readUnicodeString(in, size);
    int d = readInt(in);

    size = readInt(in);
    for (int i = 0; i < size; i++) {
      int dx = readInt(in);
    }
    size = readInt(in);
    for (int i = 0; i < size; i++) {
      int dx = readInt(in);
    }
  } else {
    CClass c; 
    CClass_Load(in, c);
    int type = readInt(in);
    int d = readInt(in);

    int size = readInt(in);
    for (int i = 0; i < size; i++) {
      int dx = readInt(in);
    }
    size = readInt(in);
    for (int i = 0; i < size; i++) {
      int dx = readInt(in);
    }
  }
}

void driver_jgex_binary::CAngle_Load(std::ifstream& in) {
  if (CMisc::version_load_now < 0.01) {
    int m_id = readInt(in);
    int dx = readInt(in);
    int dy = readInt(in);
    int radius = readInt(in);
    int px = readInt(in);
    int py = readInt(in);
    DrawType_Load(in);
  } else {
    CClass c;
    CClass_Load(in, c);
    int dx = readInt(in);
    int dy = readInt(in);
    int px = readInt(in);
    int py = readInt(in);
    int radius = readInt(in);
    if (CMisc::version_load_now >= 0.042) {
      int show_type = readInt(in);
      int ftype = readInt(in);
      int value1 = readInt(in);
    }
  }
}

void driver_jgex_binary::CText_Load(std::ifstream& in) {
  if (CMisc::version_load_now < 0.010) {
    int m_id = readInt(in);
    int x = readInt(in);
    int y = readInt(in);
    int size = readInt(in);
    std::string s = readString(in, size);
    if (CMisc::version_load_now >= 0.005) {
      int n = readInt(in);
      std::string str = readString(in, n);
      int type = readInt(in);
      int sz = readInt(in);
      int rgb = readInt(in);
    }
  } else {
    CClass c;
    CClass_Load(in, c);
    int type = readInt(in);
    int x = readInt(in);
    int y = readInt(in);

    int n = readInt(in);
    std::string name = readString(in, n);

    int font_type = readInt(in);
    
    int sz = readInt(in);

    int NORMAL_TEXT = 0;
    int NAME_TEXT = 1;
    int CNAME_TEXT = 2;
    int VALUE_TEXT = 3;
    

    if (type == NORMAL_TEXT) {
      int size = readInt(in);
      std::string str = readString(in, size);
    } else if (type == NAME_TEXT) {
      int id = readInt(in);
    } else if (type == CNAME_TEXT) {
      int size = readInt(in);
      std::string str = readString(in, size);
      int id = readInt(in);
    } else if (type == VALUE_TEXT) {
      int size = readInt(in);
      std::string str = readString(in, size);

      if (CMisc::version_load_now >= 0.052) {
	int id = readInt(in);
      }
    }
  }
}

void driver_jgex_binary::CTMark_Load(std::ifstream& in) {
  CClass c;
  CClass_Load(in, c);
  int d = readInt(in);
  d = readInt(in);

  int length;
  if (CMisc::version_load_now >= 0.053)
    length = readInt(in);
  else
    length = -1;
}

void driver_jgex_binary::Arrow_Load(std::ifstream& in) {
  CClass c;
  CClass_Load(in, c);
  int p_start = readInt(in);
  int p_end = readInt(in);
  int angle = readInt(in);
  int length = readInt(in);
}

void driver_jgex_binary::Cedmark_Load(std::ifstream& in) {
  CClass c;
  CClass_Load(in, c);
  int id = readInt(in);
  id = readInt(in);
  int length = readInt(in);
  int dnum = readInt(in);
}

void driver_jgex_binary::Constraint_Load(std::ifstream& in) {
  int id = readInt(in);
  int ConstraintType = readInt(in);
  int size = readInt(in);
  for (int i = 0; i < size; i++) {
    int t = readInt(in);
    int d = readInt(in);
  }
  int proportion = readInt(in);
  bool is_poly_generate = readBool(in);
}

void ReadList(std::ifstream& in) {
  int size = readInt(in);
  for (int i = 0; i < size; i++) {
    int id = readInt(in);
  }
}

void driver_jgex_binary::UndoStruct_Load(std::ifstream& in) {
  int m_id;
  if (CMisc::version_load_now >= 0.019) {
    m_id = readInt(in);
  } else {
    m_id = CMisc::id_count++;
  }

  if (CMisc::version_load_now >= 0.015) {
    int m_type = readInt(in);
  }
  
  if (CMisc::version_load_now > 0.01) {
    bool done = readBool(in);
    bool flash = readBool(in);
    int action = readInt(in);
  }

  if (CMisc::version_load_now < 0.01) {
    int size = readInt(in);
    std::string str = readString(in, size);
  }
  
  int id = readInt(in);
  int current_id = readInt(in);
  int paraCounter = readInt(in);
  int pnameCounter = readInt(in);
  int plineCounter = readInt(in);
  int pcircleCounter = readInt(in);

  // for 0.01
  if (CMisc::version_load_now > 0.010) {
    int size = readInt(in);
    if (size > 0) {
      std::string msg = readString(in, size);
      std::smatch match;
      // Match: Point A
      std::regex point_re(R"(Point\s+([A-Z]))");
      // Match: Line AB
      std::regex line_re(R"(Line\s+([A-Z])([A-Z]))");
      // Match: the midpoint of AB
      std::regex midpoint_re(R"(([A-Z]): the midpoint of\s+([A-Z])([A-Z]))");
      // Match: intersection of AB and CD
      std::regex intersection_re(R"(([A-Z]): intersection of\s+([A-Z]{2})\s+and\s+([A-Z]{2}))");
      // Match: AB perp CD with foot B
      std::regex foot_re(R"(([A-Z])([A-Z]) perp ([A-Z])([A-Z]) with foot ([A-Z]))");

      // Match: Line l10 perp AB passing C
      std::regex perp_re(R"(Line ([A-Za-z][A-Z-a-z0-9]*) perp ([A-Za-z][A-Za-z0-9]*) passing ([A-Z]))");

      // Match: triangle A B C
      std::regex triangle_re(R"(triangle\s+([A-Z])([A-Z])([A-Z]))");
      
      
      if (std::regex_match(msg, match, point_re)) {
	std::string name = match[1];
	auto it = points.find(name);
	double x = 0.0, y = 0.0;
	if (it != points.end()) {
	  x = it->second.x; y = it->second.y;
	} else {
	  std::cerr << "Unknown point " << name << std::endl;
	}
	hypotheses.push_back(std::make_shared<FreePoint>(name, x, y));
      } else if (std::regex_match(msg, match, line_re)) {
	std::string point1 = match[1], point2 = match[2];
	hypotheses.push_back(std::make_shared<Line>(point1+point2, point1, point2));
      } else if (std::regex_match(msg, match, midpoint_re)) {
	std::string midpoint = match[1], point1 = match[2], point2 = match[3];
	hypotheses.push_back(std::make_shared<FunMidpoint>(midpoint, point1, point2));
      } else if (std::regex_match(msg, match, intersection_re)) {
	std::string intersection = match[1], line1 = match[2], line2 = match[3];
	hypotheses.push_back(std::make_shared<FunIntersectLL>(intersection, line1, line2));
      } else if (std::regex_match(msg, match, foot_re)) {
	std::string A = match[1], B = match[2], C = match[3], D = match[4], F = match[5];
	hypotheses.push_back(std::make_shared<FunFoot>(F, A, C+D));
      } else if (std::regex_match(msg, match, perp_re)) {
	std::string line = match[1], AB = match[2], C = match[3];
	hypotheses.push_back(std::make_shared<FunPerpendicular>(line, C, AB));
      } else if (std::regex_match(msg, match, triangle_re)) {
	std::string A = match[1], B = match[2], C = match[3];

	auto it = points.find(A);
	double xA = 0.0, yA = 0.0;
	if (it != points.end()) {
	  xA = it->second.x; yA = it->second.y;
	} else {
	  std::cerr << "Unknown point " << A << std::endl;
	}

	it = points.find(B);
	double xB = 0.0, yB = 0.0;
	if (it != points.end()) {
	  xB = it->second.x; yB = it->second.y;
	} else {
	  std::cerr << "Unknown point " << B << std::endl;
	}

	it = points.find(C);
	double xC = 0.0, yC = 0.0;
	if (it != points.end()) {
	  xC = it->second.x; yC = it->second.y;
	} else {
	  std::cerr << "Unknown point " << C << std::endl;
	}	
	
	
	hypotheses.push_back(std::make_shared<Triangle>(A, xA, yA, B, xB, yB, C, xC, yC));
      } else
	std::cerr << "Unknown command: " << msg << '\n';
    }
  }

  int id_b = readInt(in);
  int paraCounter_b = readInt(in);
  int pnameCounter_b = readInt(in);
  int plineCounter_b = readInt(in);
  int pcircleCounter_b = readInt(in);
  
  if (CMisc::version_load_now >= 0.016) {
    ReadList(in);
  }

  if (CMisc::version_load_now >= 0.012) {
    int size = readInt(in);
    for (int i = 0; i < size; i++) {
      UndoStruct_Load(in);
    }
  }
}

bool driver_jgex_binary::Load(std::ifstream& in) {
  std::string title = readString(in, 2);
  if (title != "GE") return false;

  double version = readDouble(in);
  CMisc::version_load_now = version;

  if (version < 0.006) {
    std::cerr << "Error version " << std::to_string(version) << '\n';
    return false;
  }

  Load_global(in);

  int idcount = CMisc::id_count = readInt(in);
  
  // poly.clearZeroN();

  int GridX = readInt(in);
  int GridY = readInt(in);
  bool DRAWGRID = readBool(in);
  bool SNAP = readBool(in);
  int CurrentAction = readInt(in);

  int pnameCounter = readInt(in);
  int plineCounter = readInt(in);
  int pcircleCounter = readInt(in);
  paraCounter = readInt(in);

  parameters.resize(paraCounter - 1);
  for (int i = 0; i < paraCounter - 1; ++i) {
    Parameter_Load(in, parameters[i]);
  }
  
  // paraBackup.resize(paraCounter - 1);
  for (int i = 0; i < paraCounter - 1; ++i) {
    double paraBackupI = readDouble(in);
  }

  int size;
  if (CMisc::version_load_now < 0.01) {
    size = readInt(in);
    int trackCounter = size;
    if (CMisc::version_load_now >= 0.008) {
      for (int i = 0; i < 2 * trackCounter; i++) {
	readInt(in);
      }
    } else {
      for (int i = 0; i < trackCounter; i++) {
	readInt(in);
      }
    }
  } else if (CMisc::version_load_now < 0.012) {
    size = readInt(in);
    for (int i = 0; i < size; i++) {
      CTrace_Load(in);
    }
  }

  size = readInt(in);
  for (int i = 0; i < size; i++) {
    int d = readInt(in);
  }  

  size = readInt(in);
  for (int i = 0; i < size; i++) {
    CPoint_Load(in);
  }

  size = readInt(in);
  for (int i = 0; i < size; i++) {
    CLine_Load(in);
  }  

  size = readInt(in);
  for (int i = 0; i < size; i++) {
    Circle_Load(in);
  }

  size = readInt(in);
  for (int i = 0; i < size; i++) {
    CAngle_Load(in);
  }
  
  size = readInt(in);
  for (int i = 0; i < size; i++) {
    // FIXME
    // CDistance_Load(in);
  }
  
  size = readInt(in);
  for (int i = 0; i < size; i++) {
    // FIXME
    // Polygon_Load(in);
  }
    
  size = readInt(in);
  for (int i = 0; i < size; i++) {
    CText_Load(in);
  }

  if (CMisc::version_load_now >= 0.012) {
    size = readInt(in);
    for (int i = 0; i < size; i++) {
      // FIXME
      // CTrace_Load(in);
    }
  }

  if (CMisc::version_load_now >= 0.017) {
    size = readInt(in);
    
    if (CMisc::version_load_now <= 0.040) {
      for (int i = 0; i < size; i++) {
	// FIXME
	// Cedmark_Load(in);
      }
    } else {
      for (int i = 0; i < size; i++) {
	int t = readInt(in);
	const int EQMARK = 11;
	const int TMARK = 12;
	const int ARROW = 13;
	
	switch (t) {
	case TMARK: {
	  CTMark_Load(in);
	}
	  break;
	case ARROW: {
	  Arrow_Load(in);
	  break;
	}
	case EQMARK:
	case 0: {
	  Cedmark_Load(in);
	}
	  break;
	default:
	  std::cerr << "Mark unidentified!" << std::endl;
	  break;
	}
      }
    }
  }
  
  size = readInt(in);
  for (int i = 0; i < size; i++) {
    Constraint_Load(in);
  }


  size = readInt(in);
  for (int i = 0; i < size; i++) {
    UndoStruct_Load(in);
  }

  UndoStruct_Load(in);
  return true;
}

int driver_jgex_binary::do_parse() {
  std::ifstream in(file_name, std::ios::binary);
  if (!in) {
    std::cerr << "Failed to open file.\n";
    return 1;
  }
  
  try {
    Load(in);
  } catch (const std::exception& e) {
    std::cerr << "Error: " << e.what() << "\n";
    return 1;
  }
  return 0;
}
