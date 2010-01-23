/*

EGYPT Toolkit for Statistical Machine Translation
Written by Yaser Al-Onaizan, Jan Curin, Michael Jahr, Kevin Knight, John Lafferty, Dan Melamed, David Purdy, Franz Och, Noah Smith, and David Yarowsky.

This program is free software; you can redistribute it and/or
modify it under the terms of the GNU General Public License
as published by the Free Software Foundation; either version 2
of the License, or (at your option) any later version.

This program is distributed in the hope that it will be useful, 
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program; if not, write to the Free Software
Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, 
USA.

*/
/* Noah A. Smith
   Dictionary object for dictionary filter in Model 1 training

   9 August 1999
*/

#include <iostream>
#include <fstream>

#include "Vector.h"

#ifndef DICTIONARY_H
#define DICTIONARY_H

class Dictionary{
 private:
  Vector<int> pairs[2];
  int currval;
  int currindexmin;
  int currindexmax;
  bool dead;
 public:
  Dictionary(const char *);
  bool indict(int, int);
};

#endif
