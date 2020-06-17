##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=PEX4
ConfigurationName      :=Debug
WorkspacePath          := "C:\Users\C18Jacob.Orner\Documents\Schoolwork\Spring_2016\CS223"
ProjectPath            := "C:\Users\C18Jacob.Orner\Desktop\PEX4\PEX4\PEX4"
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=C18Jacob.Orner
Date                   :=09/05/2016
CodeLitePath           :="C:\Program Files\CodeLite"
LinkerName             :=C:/TDM-GCC-32/bin/g++.exe
SharedObjectLinkerName :=C:/TDM-GCC-32/bin/g++.exe -shared -fPIC
ObjectSuffix           :=.o
DependSuffix           :=.o.d
PreprocessSuffix       :=.i
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
SourceSwitch           :=-c 
OutputFile             :=$(IntermediateDirectory)/$(ProjectName)
Preprocessors          :=
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :="PEX4.txt"
PCHCompileFlags        :=
MakeDirCommand         :=makedir
RcCmpOptions           := 
RcCompilerName         :=C:/TDM-GCC-32/bin/windres.exe
LinkOptions            :=  
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). $(IncludeSwitch)./SDL2-2.0.4/include 
IncludePCH             := 
RcIncludePath          := 
Libs                   := $(LibrarySwitch)SDL2 $(LibrarySwitch)SDL2main 
ArLibs                 :=  "SDL2" "SDL2main" 
LibPath                := $(LibraryPathSwitch). $(LibraryPathSwitch)./SDL2-2.0.4/i686-w64-mingw32/lib 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := C:/TDM-GCC-32/bin/ar.exe rcu
CXX      := C:/TDM-GCC-32/bin/g++.exe
CC       := C:/TDM-GCC-32/bin/gcc.exe
CXXFLAGS :=  -g -O0 -Wall $(Preprocessors)
CFLAGS   :=  -g -O0 -Wall -std=c99 $(Preprocessors)
ASFLAGS  := 
AS       := C:/TDM-GCC-32/bin/as.exe


##
## User defined environment variables
##
CodeLiteDir:=C:\Program Files\CodeLite
Objects0=$(IntermediateDirectory)/main.c$(ObjectSuffix) $(IntermediateDirectory)/Graph.c$(ObjectSuffix) $(IntermediateDirectory)/InstructorGameLogic.c$(ObjectSuffix) $(IntermediateDirectory)/SDL2_framerate.c$(ObjectSuffix) $(IntermediateDirectory)/SDL2_gfxPrimitives.c$(ObjectSuffix) $(IntermediateDirectory)/SDL2_imageFilter.c$(ObjectSuffix) $(IntermediateDirectory)/SDL2_rotozoom.c$(ObjectSuffix) $(IntermediateDirectory)/MyGraphFunctions.c$(ObjectSuffix) $(IntermediateDirectory)/PriorityQueue.c$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all clean PreBuild PrePreBuild PostBuild MakeIntermediateDirs
all: $(OutputFile)

$(OutputFile): $(IntermediateDirectory)/.d $(Objects) 
	@$(MakeDirCommand) $(@D)
	@echo "" > $(IntermediateDirectory)/.d
	@echo $(Objects0)  > $(ObjectsFileList)
	$(LinkerName) $(OutputSwitch)$(OutputFile) @$(ObjectsFileList) $(LibPath) $(Libs) $(LinkOptions)

PostBuild:
	@echo Executing Post Build commands ...
	copy SDL2-2.0.4\i686-w64-mingw32\bin\SDL2.dll Debug
	@echo Done

MakeIntermediateDirs:
	@$(MakeDirCommand) "./Debug"


$(IntermediateDirectory)/.d:
	@$(MakeDirCommand) "./Debug"

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/main.c$(ObjectSuffix): main.c $(IntermediateDirectory)/main.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/C18Jacob.Orner/Desktop/PEX4/PEX4/PEX4/main.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/main.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/main.c$(DependSuffix): main.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/main.c$(ObjectSuffix) -MF$(IntermediateDirectory)/main.c$(DependSuffix) -MM "main.c"

$(IntermediateDirectory)/main.c$(PreprocessSuffix): main.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/main.c$(PreprocessSuffix) "main.c"

$(IntermediateDirectory)/Graph.c$(ObjectSuffix): Graph.c $(IntermediateDirectory)/Graph.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/C18Jacob.Orner/Desktop/PEX4/PEX4/PEX4/Graph.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/Graph.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/Graph.c$(DependSuffix): Graph.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/Graph.c$(ObjectSuffix) -MF$(IntermediateDirectory)/Graph.c$(DependSuffix) -MM "Graph.c"

$(IntermediateDirectory)/Graph.c$(PreprocessSuffix): Graph.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/Graph.c$(PreprocessSuffix) "Graph.c"

$(IntermediateDirectory)/InstructorGameLogic.c$(ObjectSuffix): InstructorGameLogic.c $(IntermediateDirectory)/InstructorGameLogic.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/C18Jacob.Orner/Desktop/PEX4/PEX4/PEX4/InstructorGameLogic.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/InstructorGameLogic.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/InstructorGameLogic.c$(DependSuffix): InstructorGameLogic.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/InstructorGameLogic.c$(ObjectSuffix) -MF$(IntermediateDirectory)/InstructorGameLogic.c$(DependSuffix) -MM "InstructorGameLogic.c"

$(IntermediateDirectory)/InstructorGameLogic.c$(PreprocessSuffix): InstructorGameLogic.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/InstructorGameLogic.c$(PreprocessSuffix) "InstructorGameLogic.c"

$(IntermediateDirectory)/SDL2_framerate.c$(ObjectSuffix): SDL2_framerate.c $(IntermediateDirectory)/SDL2_framerate.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/C18Jacob.Orner/Desktop/PEX4/PEX4/PEX4/SDL2_framerate.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/SDL2_framerate.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/SDL2_framerate.c$(DependSuffix): SDL2_framerate.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/SDL2_framerate.c$(ObjectSuffix) -MF$(IntermediateDirectory)/SDL2_framerate.c$(DependSuffix) -MM "SDL2_framerate.c"

$(IntermediateDirectory)/SDL2_framerate.c$(PreprocessSuffix): SDL2_framerate.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/SDL2_framerate.c$(PreprocessSuffix) "SDL2_framerate.c"

$(IntermediateDirectory)/SDL2_gfxPrimitives.c$(ObjectSuffix): SDL2_gfxPrimitives.c $(IntermediateDirectory)/SDL2_gfxPrimitives.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/C18Jacob.Orner/Desktop/PEX4/PEX4/PEX4/SDL2_gfxPrimitives.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/SDL2_gfxPrimitives.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/SDL2_gfxPrimitives.c$(DependSuffix): SDL2_gfxPrimitives.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/SDL2_gfxPrimitives.c$(ObjectSuffix) -MF$(IntermediateDirectory)/SDL2_gfxPrimitives.c$(DependSuffix) -MM "SDL2_gfxPrimitives.c"

$(IntermediateDirectory)/SDL2_gfxPrimitives.c$(PreprocessSuffix): SDL2_gfxPrimitives.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/SDL2_gfxPrimitives.c$(PreprocessSuffix) "SDL2_gfxPrimitives.c"

$(IntermediateDirectory)/SDL2_imageFilter.c$(ObjectSuffix): SDL2_imageFilter.c $(IntermediateDirectory)/SDL2_imageFilter.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/C18Jacob.Orner/Desktop/PEX4/PEX4/PEX4/SDL2_imageFilter.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/SDL2_imageFilter.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/SDL2_imageFilter.c$(DependSuffix): SDL2_imageFilter.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/SDL2_imageFilter.c$(ObjectSuffix) -MF$(IntermediateDirectory)/SDL2_imageFilter.c$(DependSuffix) -MM "SDL2_imageFilter.c"

$(IntermediateDirectory)/SDL2_imageFilter.c$(PreprocessSuffix): SDL2_imageFilter.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/SDL2_imageFilter.c$(PreprocessSuffix) "SDL2_imageFilter.c"

$(IntermediateDirectory)/SDL2_rotozoom.c$(ObjectSuffix): SDL2_rotozoom.c $(IntermediateDirectory)/SDL2_rotozoom.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/C18Jacob.Orner/Desktop/PEX4/PEX4/PEX4/SDL2_rotozoom.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/SDL2_rotozoom.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/SDL2_rotozoom.c$(DependSuffix): SDL2_rotozoom.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/SDL2_rotozoom.c$(ObjectSuffix) -MF$(IntermediateDirectory)/SDL2_rotozoom.c$(DependSuffix) -MM "SDL2_rotozoom.c"

$(IntermediateDirectory)/SDL2_rotozoom.c$(PreprocessSuffix): SDL2_rotozoom.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/SDL2_rotozoom.c$(PreprocessSuffix) "SDL2_rotozoom.c"

$(IntermediateDirectory)/MyGraphFunctions.c$(ObjectSuffix): MyGraphFunctions.c $(IntermediateDirectory)/MyGraphFunctions.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/C18Jacob.Orner/Desktop/PEX4/PEX4/PEX4/MyGraphFunctions.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/MyGraphFunctions.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/MyGraphFunctions.c$(DependSuffix): MyGraphFunctions.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/MyGraphFunctions.c$(ObjectSuffix) -MF$(IntermediateDirectory)/MyGraphFunctions.c$(DependSuffix) -MM "MyGraphFunctions.c"

$(IntermediateDirectory)/MyGraphFunctions.c$(PreprocessSuffix): MyGraphFunctions.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/MyGraphFunctions.c$(PreprocessSuffix) "MyGraphFunctions.c"

$(IntermediateDirectory)/PriorityQueue.c$(ObjectSuffix): PriorityQueue.c $(IntermediateDirectory)/PriorityQueue.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/C18Jacob.Orner/Desktop/PEX4/PEX4/PEX4/PriorityQueue.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/PriorityQueue.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/PriorityQueue.c$(DependSuffix): PriorityQueue.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/PriorityQueue.c$(ObjectSuffix) -MF$(IntermediateDirectory)/PriorityQueue.c$(DependSuffix) -MM "PriorityQueue.c"

$(IntermediateDirectory)/PriorityQueue.c$(PreprocessSuffix): PriorityQueue.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/PriorityQueue.c$(PreprocessSuffix) "PriorityQueue.c"


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


