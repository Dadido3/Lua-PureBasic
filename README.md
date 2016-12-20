LUA 5.3.0 include for PureBasic
=====

This repository contains all needed binaries and include files to embed Lua into PureBasic.
Supported operating systems are Windows and any Linux derivative (Even though Linux was only tested with an older version of Lua).
MacOS should also work, but for this some additions have to be made to the include and the correct shared/static library files have to be gathered or compiled manually.

## Usage
An [example](/Example.pb) on how to use Lua is included in this repository. It shows how to create a Lua state, how to register PB functions to make them accessible from within Lua, and how to load and run Lua-strings or Lua-files.

To make Lua work on Windows you have to copy the according (x86 or x64) shared library (*.dll) into the same folder as your application.
The *.dll files can be found in `Libraries\Lua\Binaries\Windows\x__\`, for Linux no files have to be copied because the static version of Lua is used there for easiness.

## License
Lua itself is distributed under the terms of the [MIT license](/Libraries/Lua/LICENSE).

However, i can't give any warranty on the correctness of the code, therefore:
```
THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
```

## Bugs?
If you find an include related bug, feel free to open a new issue here or send me a PM on the PureBasic forums.
