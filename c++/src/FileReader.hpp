//
//  FileReader.hpp
//  PlayGround
//
//  Created by birney on 2019/1/7.
//  Copyright © 2019年 Grocery. All rights reserved.
//

#ifndef FileReader_hpp
#define FileReader_hpp

#include <iostream>
#include <string>

class FileReader {
private:
    std::string fileName;
    int firstCharacterIndex(std::string s, int start);
    bool isLetter(char ch);
public:
    FileReader(const std::string& fineName);
    bool readAllWords(std::vector<std::string>& vec);
};

#endif /* FileReader_hpp */
