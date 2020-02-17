//
//  FileReader.cpp
//  PlayGround
//
//  Created by birney on 2019/1/7.
//  Copyright © 2019年 Grocery. All rights reserved.
//

#include "FileReader.hpp"
#include <fstream>
#include <vector>
#include <string>
#include <sstream>
#include <locale>

FileReader::FileReader(const std::string& fileName) {
    this->fileName = fileName;
}

bool FileReader::readAllWords(std::vector<std::string>& vec) {
    std::ifstream fin(this->fileName.c_str(),std::fstream::in);
    if(!fin.is_open()) {
        return false;
    }
    
    std::filebuf* pbuf = fin.rdbuf();
    
    // get file size using buffer's members
    std::size_t size = pbuf->pubseekoff (0,fin.end,fin.in);
    pbuf->pubseekpos (0,fin.in);
    
    // allocate memory to contain file data
    char* buffer=new char[size];
    
    // get file data
    pbuf->sgetn (buffer,size);
    fin.close();
    std::string contents = std::string(buffer);
    delete[] buffer;
    /// 简单分词
    std::locale loc;
    int start = firstCharacterIndex(contents, 0);
    for (int i = start; i < contents.length(); ){
        //char ch = contents.at(i);
        if (!isLetter(contents.at(i))) {
            std::string word = contents.substr(start, i-start);
            std::for_each(word.begin(), word.end(), [](char &c){
                c = std::tolower(c);
            });
            vec.push_back(word);
            start = firstCharacterIndex(contents, i);
            i = start;
        } else {
            i++;
        }
    }
    
    return true;
}


int FileReader::firstCharacterIndex(std::string s, int start) {
    for( int i = start ; i < s.length() ; i ++ ){
        if( isLetter(s.at(i)) ) {
            return i;
        }
    }
    
    return (int)s.length();
}

bool FileReader::isLetter(char ch) {
    if ((ch >= 'A' && ch <='Z')||
        (ch >= 'a' && ch <= 'z')) {
        return true;
    }
    return false;
}
