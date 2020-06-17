##
## Auto Generated makefile by CodeLite IDE
## any manual changes will be erased      
##
## Debug
ProjectName            :=PEX3_Orner
ConfigurationName      :=Debug
WorkspacePath          := "C:\Users\C18Jacob.Orner\Documents\Schoolwork\Spring_2016\CS223"
ProjectPath            := "C:\Users\C18Jacob.Orner\Documents\Schoolwork\Spring_2016\CS223\PEX3_Orner"
IntermediateDirectory  :=./Debug
OutDir                 := $(IntermediateDirectory)
CurrentFileName        :=
CurrentFilePath        :=
CurrentFileFullPath    :=
User                   :=C18Jacob.Orner
Date                   :=21/04/2016
CodeLitePath           :="C:\Program Files\CodeLite"
LinkerName             :=C:/TDM-GCC-64/bin/g++.exe
SharedObjectLinkerName :=C:/TDM-GCC-64/bin/g++.exe -shared -fPIC
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
ObjectsFileList        :="PEX3_Orner.txt"
PCHCompileFlags        :=
MakeDirCommand         :=makedir
RcCmpOptions           := 
RcCompilerName         :=C:/TDM-GCC-64/bin/windres.exe
LinkOptions            :=  
IncludePath            :=  $(IncludeSwitch). $(IncludeSwitch). 
IncludePCH             := 
RcIncludePath          := 
Libs                   := 
ArLibs                 :=  
LibPath                := $(LibraryPathSwitch). 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       := C:/TDM-GCC-64/bin/ar.exe rcu
CXX      := C:/TDM-GCC-64/bin/g++.exe
CC       := C:/TDM-GCC-64/bin/gcc.exe
CXXFLAGS :=  -g -O0 -Wall $(Preprocessors)
CFLAGS   :=  -g -O0 -Wall $(Preprocessors)
ASFLAGS  := 
AS       := C:/TDM-GCC-64/bin/as.exe


##
## User defined environment variables
##
CodeLiteDir:=C:\Program Files\CodeLite
Objects0=$(IntermediateDirectory)/main.c$(ObjectSuffix) $(IntermediateDirectory)/ternary_tree_library.c$(ObjectSuffix) $(IntermediateDirectory)/TestsOrner.c$(ObjectSuffix) 



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

MakeIntermediateDirs:
	@$(MakeDirCommand) "./Debug"


$(IntermediateDirectory)/.d:
	@$(MakeDirCommand) "./Debug"

PreBuild:


##
## Objects
##
$(IntermediateDirectory)/main.c$(ObjectSuffix): main.c $(IntermediateDirectory)/main.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/C18Jacob.Orner/Documents/Schoolwork/Spring_2016/CS223/PEX3_Orner/main.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/main.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/main.c$(DependSuffix): main.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/main.c$(ObjectSuffix) -MF$(IntermediateDirectory)/main.c$(DependSuffix) -MM "main.c"

$(IntermediateDirectory)/main.c$(PreprocessSuffix): main.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/main.c$(PreprocessSuffix) "main.c"

$(IntermediateDirectory)/ternary_tree_library.c$(ObjectSuffix): ternary_tree_library.c $(IntermediateDirectory)/ternary_tree_library.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/C18Jacob.Orner/Documents/Schoolwork/Spring_2016/CS223/PEX3_Orner/ternary_tree_library.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/ternary_tree_library.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/ternary_tree_library.c$(DependSuffix): ternary_tree_library.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/ternary_tree_library.c$(ObjectSuffix) -MF$(IntermediateDirectory)/ternary_tree_library.c$(DependSuffix) -MM "ternary_tree_library.c"

$(IntermediateDirectory)/ternary_tree_library.c$(PreprocessSuffix): ternary_tree_library.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/ternary_tree_library.c$(PreprocessSuffix) "ternary_tree_library.c"

$(IntermediateDirectory)/TestsOrner.c$(ObjectSuffix): TestsOrner.c $(IntermediateDirectory)/TestsOrner.c$(DependSuffix)
	$(CC) $(SourceSwitch) "C:/Users/C18Jacob.Orner/Documents/Schoolwork/Spring_2016/CS223/PEX3_Orner/TestsOrner.c" $(CFLAGS) $(ObjectSwitch)$(IntermediateDirectory)/TestsOrner.c$(ObjectSuffix) $(IncludePath)
$(IntermediateDirectory)/TestsOrner.c$(DependSuffix): TestsOrner.c
	@$(CC) $(CFLAGS) $(IncludePath) -MG -MP -MT$(IntermediateDirectory)/TestsOrner.c$(ObjectSuffix) -MF$(IntermediateDirectory)/TestsOrner.c$(DependSuffix) -MM "TestsOrner.c"

$(IntermediateDirectory)/TestsOrner.c$(PreprocessSuffix): TestsOrner.c
	$(CC) $(CFLAGS) $(IncludePath) $(PreprocessOnlySwitch) $(OutputSwitch) $(IntermediateDirectory)/TestsOrner.c$(PreprocessSuffix) "TestsOrner.c"


-include $(IntermediateDirectory)/*$(DependSuffix)
##
## Clean
##
clean:
	$(RM) -r ./Debug/


