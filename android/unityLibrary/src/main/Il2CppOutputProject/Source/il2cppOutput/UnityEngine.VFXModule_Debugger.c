#include "pch-c.h"
#ifndef _MSC_VER
# include <alloca.h>
#else
# include <malloc.h>
#endif


#include "codegen/il2cpp-codegen-metadata.h"





#if IL2CPP_MONO_DEBUGGER
static const Il2CppMethodExecutionContextInfo g_methodExecutionContextInfos[5] = 
{
	{ 16339, 0,  0 } /*tableIndex: 0 */,
	{ 16342, 1,  2 } /*tableIndex: 1 */,
	{ 16346, 2,  4 } /*tableIndex: 2 */,
	{ 16339, 3,  7 } /*tableIndex: 3 */,
	{ 16344, 4,  9 } /*tableIndex: 4 */,
};
#else
static const Il2CppMethodExecutionContextInfo g_methodExecutionContextInfos[1] = { { 0, 0, 0 } };
#endif
#if IL2CPP_MONO_DEBUGGER
static const char* g_methodExecutionContextInfoStrings[5] = 
{
	"eventAttribute",
	"expressionValue",
	"spawnerState",
	"vfxEventAttribute",
	"evt",
};
#else
static const char* g_methodExecutionContextInfoStrings[1] = { NULL };
#endif
#if IL2CPP_MONO_DEBUGGER
static const Il2CppMethodExecutionContextInfoIndex g_methodExecutionContextInfoIndexes[30] = 
{
	{ 0, 0 } /* 0x06000001 System.Void UnityEngine.VFX.VFXEventAttribute::.ctor(System.IntPtr,System.Boolean,UnityEngine.VFX.VisualEffectAsset) */,
	{ 0, 0 } /* 0x06000002 System.IntPtr UnityEngine.VFX.VFXEventAttribute::Internal_Create() */,
	{ 0, 1 } /* 0x06000003 UnityEngine.VFX.VFXEventAttribute UnityEngine.VFX.VFXEventAttribute::Internal_InstanciateVFXEventAttribute(UnityEngine.VFX.VisualEffectAsset) */,
	{ 0, 0 } /* 0x06000004 System.Void UnityEngine.VFX.VFXEventAttribute::Internal_InitFromAsset(UnityEngine.VFX.VisualEffectAsset) */,
	{ 0, 0 } /* 0x06000005 System.Void UnityEngine.VFX.VFXEventAttribute::Release() */,
	{ 0, 0 } /* 0x06000006 System.Void UnityEngine.VFX.VFXEventAttribute::Finalize() */,
	{ 0, 0 } /* 0x06000007 System.Void UnityEngine.VFX.VFXEventAttribute::Dispose() */,
	{ 0, 0 } /* 0x06000008 System.Void UnityEngine.VFX.VFXEventAttribute::Internal_Destroy(System.IntPtr) */,
	{ 0, 0 } /* 0x06000009 System.Void UnityEngine.VFX.VFXExpressionValues::.ctor() */,
	{ 1, 1 } /* 0x0600000A UnityEngine.VFX.VFXExpressionValues UnityEngine.VFX.VFXExpressionValues::CreateExpressionValuesWrapper(System.IntPtr) */,
	{ 0, 0 } /* 0x0600000B System.Void UnityEngine.VFX.VFXManager::.cctor() */,
	{ 0, 0 } /* 0x0600000C System.Void UnityEngine.VFX.VFXSpawnerCallbacks::OnPlay(UnityEngine.VFX.VFXSpawnerState,UnityEngine.VFX.VFXExpressionValues,UnityEngine.VFX.VisualEffect) */,
	{ 0, 0 } /* 0x0600000D System.Void UnityEngine.VFX.VFXSpawnerCallbacks::OnUpdate(UnityEngine.VFX.VFXSpawnerState,UnityEngine.VFX.VFXExpressionValues,UnityEngine.VFX.VisualEffect) */,
	{ 0, 0 } /* 0x0600000E System.Void UnityEngine.VFX.VFXSpawnerCallbacks::OnStop(UnityEngine.VFX.VFXSpawnerState,UnityEngine.VFX.VFXExpressionValues,UnityEngine.VFX.VisualEffect) */,
	{ 0, 0 } /* 0x0600000F System.Void UnityEngine.VFX.VFXSpawnerCallbacks::.ctor() */,
	{ 0, 0 } /* 0x06000010 System.Void UnityEngine.VFX.VFXSpawnerState::.ctor(System.IntPtr,System.Boolean) */,
	{ 2, 1 } /* 0x06000011 UnityEngine.VFX.VFXSpawnerState UnityEngine.VFX.VFXSpawnerState::CreateSpawnerStateWrapper() */,
	{ 0, 0 } /* 0x06000012 System.Void UnityEngine.VFX.VFXSpawnerState::SetWrapValue(System.IntPtr) */,
	{ 0, 0 } /* 0x06000013 System.Void UnityEngine.VFX.VFXSpawnerState::Release() */,
	{ 0, 0 } /* 0x06000014 System.Void UnityEngine.VFX.VFXSpawnerState::Finalize() */,
	{ 0, 0 } /* 0x06000015 System.Void UnityEngine.VFX.VFXSpawnerState::Dispose() */,
	{ 0, 0 } /* 0x06000016 System.Void UnityEngine.VFX.VFXSpawnerState::Internal_Destroy(System.IntPtr) */,
	{ 0, 0 } /* 0x06000017 System.Void UnityEngine.VFX.VisualEffectObject::.ctor() */,
	{ 0, 0 } /* 0x06000018 System.Void UnityEngine.VFX.VisualEffectAsset::.ctor() */,
	{ 0, 0 } /* 0x06000019 System.Void UnityEngine.VFX.VisualEffectAsset::.cctor() */,
	{ 0, 0 } /* 0x0600001A System.Void UnityEngine.VFX.VFXOutputEventArgs::.ctor(System.Int32,UnityEngine.VFX.VFXEventAttribute) */,
	{ 0, 0 } /* 0x0600001B UnityEngine.VFX.VisualEffectAsset UnityEngine.VFX.VisualEffect::get_visualEffectAsset() */,
	{ 3, 1 } /* 0x0600001C UnityEngine.VFX.VFXEventAttribute UnityEngine.VFX.VisualEffect::CreateVFXEventAttribute() */,
	{ 0, 0 } /* 0x0600001D UnityEngine.VFX.VFXEventAttribute UnityEngine.VFX.VisualEffect::InvokeGetCachedEventAttributeForOutputEvent_Internal(UnityEngine.VFX.VisualEffect) */,
	{ 4, 1 } /* 0x0600001E System.Void UnityEngine.VFX.VisualEffect::InvokeOutputEventReceived_Internal(UnityEngine.VFX.VisualEffect,System.Int32) */,
};
#else
static const Il2CppMethodExecutionContextInfoIndex g_methodExecutionContextInfoIndexes[1] = { { 0, 0} };
#endif
#if IL2CPP_MONO_DEBUGGER
IL2CPP_EXTERN_C Il2CppSequencePoint g_sequencePointsUnityEngine_VFXModule[];
Il2CppSequencePoint g_sequencePointsUnityEngine_VFXModule[165] = 
{
	{ 60099, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 0 } /* seqPointIndex: 0 */,
	{ 60099, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 1 } /* seqPointIndex: 1 */,
	{ 60099, 1, 16, 16, 9, 86, 0, kSequencePointKind_Normal, 0, 2 } /* seqPointIndex: 2 */,
	{ 60099, 1, 16, 16, 9, 86, 1, kSequencePointKind_StepOut, 0, 3 } /* seqPointIndex: 3 */,
	{ 60099, 1, 17, 17, 9, 10, 7, kSequencePointKind_Normal, 0, 4 } /* seqPointIndex: 4 */,
	{ 60099, 1, 18, 18, 13, 25, 8, kSequencePointKind_Normal, 0, 5 } /* seqPointIndex: 5 */,
	{ 60099, 1, 19, 19, 13, 29, 15, kSequencePointKind_Normal, 0, 6 } /* seqPointIndex: 6 */,
	{ 60099, 1, 20, 20, 13, 35, 22, kSequencePointKind_Normal, 0, 7 } /* seqPointIndex: 7 */,
	{ 60099, 1, 21, 21, 9, 10, 29, kSequencePointKind_Normal, 0, 8 } /* seqPointIndex: 8 */,
	{ 60101, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 9 } /* seqPointIndex: 9 */,
	{ 60101, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 10 } /* seqPointIndex: 10 */,
	{ 60101, 1, 39, 39, 9, 10, 0, kSequencePointKind_Normal, 0, 11 } /* seqPointIndex: 11 */,
	{ 60101, 1, 40, 40, 13, 91, 1, kSequencePointKind_Normal, 0, 12 } /* seqPointIndex: 12 */,
	{ 60101, 1, 40, 40, 13, 91, 1, kSequencePointKind_StepOut, 0, 13 } /* seqPointIndex: 13 */,
	{ 60101, 1, 40, 40, 13, 91, 8, kSequencePointKind_StepOut, 0, 14 } /* seqPointIndex: 14 */,
	{ 60101, 1, 41, 41, 13, 61, 14, kSequencePointKind_Normal, 0, 15 } /* seqPointIndex: 15 */,
	{ 60101, 1, 41, 41, 13, 61, 16, kSequencePointKind_StepOut, 0, 16 } /* seqPointIndex: 16 */,
	{ 60101, 1, 42, 42, 13, 35, 22, kSequencePointKind_Normal, 0, 17 } /* seqPointIndex: 17 */,
	{ 60101, 1, 43, 43, 9, 10, 26, kSequencePointKind_Normal, 0, 18 } /* seqPointIndex: 18 */,
	{ 60103, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 19 } /* seqPointIndex: 19 */,
	{ 60103, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 20 } /* seqPointIndex: 20 */,
	{ 60103, 1, 51, 51, 9, 10, 0, kSequencePointKind_Normal, 0, 21 } /* seqPointIndex: 21 */,
	{ 60103, 1, 52, 52, 13, 49, 1, kSequencePointKind_Normal, 0, 22 } /* seqPointIndex: 22 */,
	{ 60103, 1, 52, 52, 13, 49, 20, kSequencePointKind_StepOut, 0, 23 } /* seqPointIndex: 23 */,
	{ 60103, 1, 52, 52, 0, 0, 29, kSequencePointKind_Normal, 0, 24 } /* seqPointIndex: 24 */,
	{ 60103, 1, 53, 53, 13, 14, 32, kSequencePointKind_Normal, 0, 25 } /* seqPointIndex: 25 */,
	{ 60103, 1, 54, 54, 17, 41, 33, kSequencePointKind_Normal, 0, 26 } /* seqPointIndex: 26 */,
	{ 60103, 1, 54, 54, 17, 41, 39, kSequencePointKind_StepOut, 0, 27 } /* seqPointIndex: 27 */,
	{ 60103, 1, 55, 55, 13, 14, 45, kSequencePointKind_Normal, 0, 28 } /* seqPointIndex: 28 */,
	{ 60103, 1, 56, 56, 13, 33, 46, kSequencePointKind_Normal, 0, 29 } /* seqPointIndex: 29 */,
	{ 60103, 1, 57, 57, 13, 31, 57, kSequencePointKind_Normal, 0, 30 } /* seqPointIndex: 30 */,
	{ 60103, 1, 58, 58, 9, 10, 64, kSequencePointKind_Normal, 0, 31 } /* seqPointIndex: 31 */,
	{ 60104, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 32 } /* seqPointIndex: 32 */,
	{ 60104, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 33 } /* seqPointIndex: 33 */,
	{ 60104, 1, 61, 61, 9, 10, 0, kSequencePointKind_Normal, 0, 34 } /* seqPointIndex: 34 */,
	{ 60104, 1, 61, 61, 9, 10, 1, kSequencePointKind_Normal, 0, 35 } /* seqPointIndex: 35 */,
	{ 60104, 1, 62, 62, 13, 23, 2, kSequencePointKind_Normal, 0, 36 } /* seqPointIndex: 36 */,
	{ 60104, 1, 62, 62, 13, 23, 3, kSequencePointKind_StepOut, 0, 37 } /* seqPointIndex: 37 */,
	{ 60104, 1, 63, 63, 9, 10, 11, kSequencePointKind_Normal, 0, 38 } /* seqPointIndex: 38 */,
	{ 60104, 1, 63, 63, 9, 10, 12, kSequencePointKind_StepOut, 0, 39 } /* seqPointIndex: 39 */,
	{ 60104, 1, 63, 63, 9, 10, 19, kSequencePointKind_Normal, 0, 40 } /* seqPointIndex: 40 */,
	{ 60105, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 41 } /* seqPointIndex: 41 */,
	{ 60105, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 42 } /* seqPointIndex: 42 */,
	{ 60105, 1, 66, 66, 9, 10, 0, kSequencePointKind_Normal, 0, 43 } /* seqPointIndex: 43 */,
	{ 60105, 1, 67, 67, 13, 23, 1, kSequencePointKind_Normal, 0, 44 } /* seqPointIndex: 44 */,
	{ 60105, 1, 67, 67, 13, 23, 2, kSequencePointKind_StepOut, 0, 45 } /* seqPointIndex: 45 */,
	{ 60105, 1, 68, 68, 13, 39, 8, kSequencePointKind_Normal, 0, 46 } /* seqPointIndex: 46 */,
	{ 60105, 1, 68, 68, 13, 39, 9, kSequencePointKind_StepOut, 0, 47 } /* seqPointIndex: 47 */,
	{ 60105, 1, 69, 69, 9, 10, 15, kSequencePointKind_Normal, 0, 48 } /* seqPointIndex: 48 */,
	{ 60107, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 49 } /* seqPointIndex: 49 */,
	{ 60107, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 50 } /* seqPointIndex: 50 */,
	{ 60107, 2, 14, 14, 9, 38, 0, kSequencePointKind_Normal, 0, 51 } /* seqPointIndex: 51 */,
	{ 60107, 2, 14, 14, 9, 38, 1, kSequencePointKind_StepOut, 0, 52 } /* seqPointIndex: 52 */,
	{ 60107, 2, 15, 15, 9, 10, 7, kSequencePointKind_Normal, 0, 53 } /* seqPointIndex: 53 */,
	{ 60107, 2, 16, 16, 9, 10, 8, kSequencePointKind_Normal, 0, 54 } /* seqPointIndex: 54 */,
	{ 60108, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 55 } /* seqPointIndex: 55 */,
	{ 60108, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 56 } /* seqPointIndex: 56 */,
	{ 60108, 2, 20, 20, 9, 10, 0, kSequencePointKind_Normal, 0, 57 } /* seqPointIndex: 57 */,
	{ 60108, 2, 21, 21, 13, 61, 1, kSequencePointKind_Normal, 0, 58 } /* seqPointIndex: 58 */,
	{ 60108, 2, 21, 21, 13, 61, 1, kSequencePointKind_StepOut, 0, 59 } /* seqPointIndex: 59 */,
	{ 60108, 2, 22, 22, 13, 41, 7, kSequencePointKind_Normal, 0, 60 } /* seqPointIndex: 60 */,
	{ 60108, 2, 23, 23, 13, 36, 14, kSequencePointKind_Normal, 0, 61 } /* seqPointIndex: 61 */,
	{ 60108, 2, 24, 24, 9, 10, 18, kSequencePointKind_Normal, 0, 62 } /* seqPointIndex: 62 */,
	{ 60109, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 63 } /* seqPointIndex: 63 */,
	{ 60109, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 64 } /* seqPointIndex: 64 */,
	{ 60109, 3, 43, 43, 9, 153, 0, kSequencePointKind_Normal, 0, 65 } /* seqPointIndex: 65 */,
	{ 60114, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 66 } /* seqPointIndex: 66 */,
	{ 60114, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 67 } /* seqPointIndex: 67 */,
	{ 60114, 4, 28, 28, 9, 57, 0, kSequencePointKind_Normal, 0, 68 } /* seqPointIndex: 68 */,
	{ 60114, 4, 28, 28, 9, 57, 1, kSequencePointKind_StepOut, 0, 69 } /* seqPointIndex: 69 */,
	{ 60114, 4, 29, 29, 9, 10, 7, kSequencePointKind_Normal, 0, 70 } /* seqPointIndex: 70 */,
	{ 60114, 4, 30, 30, 13, 25, 8, kSequencePointKind_Normal, 0, 71 } /* seqPointIndex: 71 */,
	{ 60114, 4, 31, 31, 13, 29, 15, kSequencePointKind_Normal, 0, 72 } /* seqPointIndex: 72 */,
	{ 60114, 4, 32, 32, 9, 10, 22, kSequencePointKind_Normal, 0, 73 } /* seqPointIndex: 73 */,
	{ 60115, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 74 } /* seqPointIndex: 74 */,
	{ 60115, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 75 } /* seqPointIndex: 75 */,
	{ 60115, 4, 38, 38, 9, 10, 0, kSequencePointKind_Normal, 0, 76 } /* seqPointIndex: 76 */,
	{ 60115, 4, 39, 39, 13, 72, 1, kSequencePointKind_Normal, 0, 77 } /* seqPointIndex: 77 */,
	{ 60115, 4, 39, 39, 13, 72, 7, kSequencePointKind_StepOut, 0, 78 } /* seqPointIndex: 78 */,
	{ 60115, 4, 40, 40, 13, 33, 13, kSequencePointKind_Normal, 0, 79 } /* seqPointIndex: 79 */,
	{ 60115, 4, 41, 41, 9, 10, 17, kSequencePointKind_Normal, 0, 80 } /* seqPointIndex: 80 */,
	{ 60116, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 81 } /* seqPointIndex: 81 */,
	{ 60116, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 82 } /* seqPointIndex: 82 */,
	{ 60116, 4, 45, 45, 9, 10, 0, kSequencePointKind_Normal, 0, 83 } /* seqPointIndex: 83 */,
	{ 60116, 4, 46, 46, 13, 25, 1, kSequencePointKind_Normal, 0, 84 } /* seqPointIndex: 84 */,
	{ 60116, 4, 46, 46, 0, 0, 8, kSequencePointKind_Normal, 0, 85 } /* seqPointIndex: 85 */,
	{ 60116, 4, 47, 47, 13, 14, 11, kSequencePointKind_Normal, 0, 86 } /* seqPointIndex: 86 */,
	{ 60116, 4, 48, 48, 17, 107, 12, kSequencePointKind_Normal, 0, 87 } /* seqPointIndex: 87 */,
	{ 60116, 4, 48, 48, 17, 107, 17, kSequencePointKind_StepOut, 0, 88 } /* seqPointIndex: 88 */,
	{ 60116, 4, 50, 50, 13, 25, 23, kSequencePointKind_Normal, 0, 89 } /* seqPointIndex: 89 */,
	{ 60116, 4, 51, 51, 9, 10, 30, kSequencePointKind_Normal, 0, 90 } /* seqPointIndex: 90 */,
	{ 60117, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 91 } /* seqPointIndex: 91 */,
	{ 60117, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 92 } /* seqPointIndex: 92 */,
	{ 60117, 4, 59, 59, 9, 10, 0, kSequencePointKind_Normal, 0, 93 } /* seqPointIndex: 93 */,
	{ 60117, 4, 60, 60, 13, 49, 1, kSequencePointKind_Normal, 0, 94 } /* seqPointIndex: 94 */,
	{ 60117, 4, 60, 60, 13, 49, 12, kSequencePointKind_StepOut, 0, 95 } /* seqPointIndex: 95 */,
	{ 60117, 4, 60, 60, 0, 0, 29, kSequencePointKind_Normal, 0, 96 } /* seqPointIndex: 96 */,
	{ 60117, 4, 61, 61, 13, 14, 32, kSequencePointKind_Normal, 0, 97 } /* seqPointIndex: 97 */,
	{ 60117, 4, 62, 62, 17, 41, 33, kSequencePointKind_Normal, 0, 98 } /* seqPointIndex: 98 */,
	{ 60117, 4, 62, 62, 17, 41, 39, kSequencePointKind_StepOut, 0, 99 } /* seqPointIndex: 99 */,
	{ 60117, 4, 63, 63, 13, 14, 45, kSequencePointKind_Normal, 0, 100 } /* seqPointIndex: 100 */,
	{ 60117, 4, 64, 64, 13, 33, 46, kSequencePointKind_Normal, 0, 101 } /* seqPointIndex: 101 */,
	{ 60117, 4, 65, 65, 9, 10, 57, kSequencePointKind_Normal, 0, 102 } /* seqPointIndex: 102 */,
	{ 60118, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 103 } /* seqPointIndex: 103 */,
	{ 60118, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 104 } /* seqPointIndex: 104 */,
	{ 60118, 4, 68, 68, 9, 10, 0, kSequencePointKind_Normal, 0, 105 } /* seqPointIndex: 105 */,
	{ 60118, 4, 68, 68, 9, 10, 1, kSequencePointKind_Normal, 0, 106 } /* seqPointIndex: 106 */,
	{ 60118, 4, 69, 69, 13, 23, 2, kSequencePointKind_Normal, 0, 107 } /* seqPointIndex: 107 */,
	{ 60118, 4, 69, 69, 13, 23, 3, kSequencePointKind_StepOut, 0, 108 } /* seqPointIndex: 108 */,
	{ 60118, 4, 70, 70, 9, 10, 11, kSequencePointKind_Normal, 0, 109 } /* seqPointIndex: 109 */,
	{ 60118, 4, 70, 70, 9, 10, 12, kSequencePointKind_StepOut, 0, 110 } /* seqPointIndex: 110 */,
	{ 60118, 4, 70, 70, 9, 10, 19, kSequencePointKind_Normal, 0, 111 } /* seqPointIndex: 111 */,
	{ 60119, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 112 } /* seqPointIndex: 112 */,
	{ 60119, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 113 } /* seqPointIndex: 113 */,
	{ 60119, 4, 73, 73, 9, 10, 0, kSequencePointKind_Normal, 0, 114 } /* seqPointIndex: 114 */,
	{ 60119, 4, 74, 74, 13, 23, 1, kSequencePointKind_Normal, 0, 115 } /* seqPointIndex: 115 */,
	{ 60119, 4, 74, 74, 13, 23, 2, kSequencePointKind_StepOut, 0, 116 } /* seqPointIndex: 116 */,
	{ 60119, 4, 75, 75, 13, 39, 8, kSequencePointKind_Normal, 0, 117 } /* seqPointIndex: 117 */,
	{ 60119, 4, 75, 75, 13, 39, 9, kSequencePointKind_StepOut, 0, 118 } /* seqPointIndex: 118 */,
	{ 60119, 4, 76, 76, 9, 10, 15, kSequencePointKind_Normal, 0, 119 } /* seqPointIndex: 119 */,
	{ 60123, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 120 } /* seqPointIndex: 120 */,
	{ 60123, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 121 } /* seqPointIndex: 121 */,
	{ 60123, 5, 36, 36, 9, 85, 0, kSequencePointKind_Normal, 0, 122 } /* seqPointIndex: 122 */,
	{ 60123, 5, 36, 36, 9, 85, 5, kSequencePointKind_StepOut, 0, 123 } /* seqPointIndex: 123 */,
	{ 60123, 5, 37, 37, 9, 85, 15, kSequencePointKind_Normal, 0, 124 } /* seqPointIndex: 124 */,
	{ 60123, 5, 37, 37, 9, 85, 20, kSequencePointKind_StepOut, 0, 125 } /* seqPointIndex: 125 */,
	{ 60124, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 126 } /* seqPointIndex: 126 */,
	{ 60124, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 127 } /* seqPointIndex: 127 */,
	{ 60124, 5, 59, 59, 9, 10, 0, kSequencePointKind_Normal, 0, 128 } /* seqPointIndex: 128 */,
	{ 60124, 5, 60, 60, 13, 34, 1, kSequencePointKind_Normal, 0, 129 } /* seqPointIndex: 129 */,
	{ 60124, 5, 61, 61, 13, 50, 8, kSequencePointKind_Normal, 0, 130 } /* seqPointIndex: 130 */,
	{ 60124, 5, 62, 62, 9, 10, 15, kSequencePointKind_Normal, 0, 131 } /* seqPointIndex: 131 */,
	{ 60126, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 132 } /* seqPointIndex: 132 */,
	{ 60126, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 133 } /* seqPointIndex: 133 */,
	{ 60126, 5, 95, 95, 9, 10, 0, kSequencePointKind_Normal, 0, 134 } /* seqPointIndex: 134 */,
	{ 60126, 5, 96, 96, 13, 43, 1, kSequencePointKind_Normal, 0, 135 } /* seqPointIndex: 135 */,
	{ 60126, 5, 96, 96, 13, 43, 2, kSequencePointKind_StepOut, 0, 136 } /* seqPointIndex: 136 */,
	{ 60126, 5, 96, 96, 13, 43, 8, kSequencePointKind_StepOut, 0, 137 } /* seqPointIndex: 137 */,
	{ 60126, 5, 96, 96, 0, 0, 14, kSequencePointKind_Normal, 0, 138 } /* seqPointIndex: 138 */,
	{ 60126, 5, 97, 97, 17, 29, 17, kSequencePointKind_Normal, 0, 139 } /* seqPointIndex: 139 */,
	{ 60126, 5, 98, 98, 13, 112, 21, kSequencePointKind_Normal, 0, 140 } /* seqPointIndex: 140 */,
	{ 60126, 5, 98, 98, 13, 112, 22, kSequencePointKind_StepOut, 0, 141 } /* seqPointIndex: 141 */,
	{ 60126, 5, 98, 98, 13, 112, 27, kSequencePointKind_StepOut, 0, 142 } /* seqPointIndex: 142 */,
	{ 60126, 5, 99, 99, 13, 38, 33, kSequencePointKind_Normal, 0, 143 } /* seqPointIndex: 143 */,
	{ 60126, 5, 100, 100, 9, 10, 37, kSequencePointKind_Normal, 0, 144 } /* seqPointIndex: 144 */,
	{ 60127, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 145 } /* seqPointIndex: 145 */,
	{ 60127, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 146 } /* seqPointIndex: 146 */,
	{ 60127, 5, 515, 515, 9, 10, 0, kSequencePointKind_Normal, 0, 147 } /* seqPointIndex: 147 */,
	{ 60127, 5, 517, 517, 13, 52, 1, kSequencePointKind_Normal, 0, 148 } /* seqPointIndex: 148 */,
	{ 60127, 5, 517, 517, 0, 0, 11, kSequencePointKind_Normal, 0, 149 } /* seqPointIndex: 149 */,
	{ 60127, 5, 518, 518, 17, 29, 14, kSequencePointKind_Normal, 0, 150 } /* seqPointIndex: 150 */,
	{ 60127, 5, 520, 520, 13, 55, 18, kSequencePointKind_Normal, 0, 151 } /* seqPointIndex: 151 */,
	{ 60127, 5, 520, 520, 0, 0, 28, kSequencePointKind_Normal, 0, 152 } /* seqPointIndex: 152 */,
	{ 60127, 5, 521, 521, 17, 82, 31, kSequencePointKind_Normal, 0, 153 } /* seqPointIndex: 153 */,
	{ 60127, 5, 521, 521, 17, 82, 33, kSequencePointKind_StepOut, 0, 154 } /* seqPointIndex: 154 */,
	{ 60127, 5, 522, 522, 13, 50, 43, kSequencePointKind_Normal, 0, 155 } /* seqPointIndex: 155 */,
	{ 60127, 5, 523, 523, 9, 10, 52, kSequencePointKind_Normal, 0, 156 } /* seqPointIndex: 156 */,
	{ 60128, 0, 0, 0, 0, 0, -1, kSequencePointKind_Normal, 0, 157 } /* seqPointIndex: 157 */,
	{ 60128, 0, 0, 0, 0, 0, 16777215, kSequencePointKind_Normal, 0, 158 } /* seqPointIndex: 158 */,
	{ 60128, 5, 528, 528, 9, 10, 0, kSequencePointKind_Normal, 0, 159 } /* seqPointIndex: 159 */,
	{ 60128, 5, 529, 529, 13, 90, 1, kSequencePointKind_Normal, 0, 160 } /* seqPointIndex: 160 */,
	{ 60128, 5, 529, 529, 13, 90, 10, kSequencePointKind_StepOut, 0, 161 } /* seqPointIndex: 161 */,
	{ 60128, 5, 530, 530, 13, 52, 15, kSequencePointKind_Normal, 0, 162 } /* seqPointIndex: 162 */,
	{ 60128, 5, 530, 530, 13, 52, 22, kSequencePointKind_StepOut, 0, 163 } /* seqPointIndex: 163 */,
	{ 60128, 5, 531, 531, 9, 10, 28, kSequencePointKind_Normal, 0, 164 } /* seqPointIndex: 164 */,
};
#else
extern Il2CppSequencePoint g_sequencePointsUnityEngine_VFXModule[];
Il2CppSequencePoint g_sequencePointsUnityEngine_VFXModule[1] = { { 0, 0, 0, 0, 0, 0, 0, kSequencePointKind_Normal, 0, 0, } };
#endif
#if IL2CPP_MONO_DEBUGGER
static const Il2CppCatchPoint g_catchPoints[1] = { { 0, 0, 0, 0, } };
#else
static const Il2CppCatchPoint g_catchPoints[1] = { { 0, 0, 0, 0, } };
#endif
#if IL2CPP_MONO_DEBUGGER
static const Il2CppSequencePointSourceFile g_sequencePointSourceFiles[] = {
{ "", { 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0} }, //0 
{ "\\Users\\bokken\\buildslave\\unity\\build\\Modules\\VFX\\Public\\ScriptBindings\\VFXEventAttribute.bindings.cs", { 29, 200, 232, 139, 55, 27, 243, 105, 4, 133, 235, 78, 114, 96, 121, 224} }, //1 
{ "\\Users\\bokken\\buildslave\\unity\\build\\Modules\\VFX\\Public\\ScriptBindings\\VFXExpressionValues.bindings.cs", { 137, 94, 30, 16, 81, 236, 48, 215, 52, 194, 54, 215, 195, 215, 95, 88} }, //2 
{ "\\Users\\bokken\\buildslave\\unity\\build\\Modules\\VFX\\Public\\ScriptBindings\\VFXManager.bindings.cs", { 218, 16, 69, 254, 104, 12, 154, 76, 202, 231, 166, 116, 60, 143, 159, 84} }, //3 
{ "\\Users\\bokken\\buildslave\\unity\\build\\Modules\\VFX\\Public\\ScriptBindings\\VFXSpawnerState.bindings.cs", { 184, 254, 37, 73, 127, 58, 170, 181, 211, 150, 155, 53, 103, 37, 155, 166} }, //4 
{ "\\Users\\bokken\\buildslave\\unity\\build\\Modules\\VFX\\Public\\ScriptBindings\\VisualEffect.bindings.cs", { 251, 41, 240, 252, 141, 87, 166, 81, 66, 247, 207, 6, 164, 124, 93, 212} }, //5 
};
#else
static const Il2CppSequencePointSourceFile g_sequencePointSourceFiles[1] = { NULL, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
#endif
#if IL2CPP_MONO_DEBUGGER
static const Il2CppTypeSourceFilePair g_typeSourceFiles[7] = 
{
	{ 8089, 1 },
	{ 8090, 2 },
	{ 8092, 3 },
	{ 8094, 4 },
	{ 8096, 5 },
	{ 8097, 5 },
	{ 8098, 5 },
};
#else
static const Il2CppTypeSourceFilePair g_typeSourceFiles[1] = { { 0, 0 } };
#endif
#if IL2CPP_MONO_DEBUGGER
static const Il2CppMethodScope g_methodScopes[10] = 
{
	{ 0, 28 },
	{ 0, 65 },
	{ 0, 20 },
	{ 0, 39 },
	{ 0, 19 },
	{ 0, 31 },
	{ 0, 58 },
	{ 0, 39 },
	{ 0, 54 },
	{ 0, 29 },
};
#else
static const Il2CppMethodScope g_methodScopes[1] = { { 0, 0 } };
#endif
#if IL2CPP_MONO_DEBUGGER
static const Il2CppMethodHeaderInfo g_methodHeaderInfos[30] = 
{
	{ 0, 0, 0 } /* System.Void UnityEngine.VFX.VFXEventAttribute::.ctor(System.IntPtr,System.Boolean,UnityEngine.VFX.VisualEffectAsset) */,
	{ 0, 0, 0 } /* System.IntPtr UnityEngine.VFX.VFXEventAttribute::Internal_Create() */,
	{ 28, 0, 1 } /* UnityEngine.VFX.VFXEventAttribute UnityEngine.VFX.VFXEventAttribute::Internal_InstanciateVFXEventAttribute(UnityEngine.VFX.VisualEffectAsset) */,
	{ 0, 0, 0 } /* System.Void UnityEngine.VFX.VFXEventAttribute::Internal_InitFromAsset(UnityEngine.VFX.VisualEffectAsset) */,
	{ 65, 1, 1 } /* System.Void UnityEngine.VFX.VFXEventAttribute::Release() */,
	{ 0, 0, 0 } /* System.Void UnityEngine.VFX.VFXEventAttribute::Finalize() */,
	{ 0, 0, 0 } /* System.Void UnityEngine.VFX.VFXEventAttribute::Dispose() */,
	{ 0, 0, 0 } /* System.Void UnityEngine.VFX.VFXEventAttribute::Internal_Destroy(System.IntPtr) */,
	{ 0, 0, 0 } /* System.Void UnityEngine.VFX.VFXExpressionValues::.ctor() */,
	{ 20, 2, 1 } /* UnityEngine.VFX.VFXExpressionValues UnityEngine.VFX.VFXExpressionValues::CreateExpressionValuesWrapper(System.IntPtr) */,
	{ 39, 3, 1 } /* System.Void UnityEngine.VFX.VFXManager::.cctor() */,
	{ 0, 0, 0 } /* System.Void UnityEngine.VFX.VFXSpawnerCallbacks::OnPlay(UnityEngine.VFX.VFXSpawnerState,UnityEngine.VFX.VFXExpressionValues,UnityEngine.VFX.VisualEffect) */,
	{ 0, 0, 0 } /* System.Void UnityEngine.VFX.VFXSpawnerCallbacks::OnUpdate(UnityEngine.VFX.VFXSpawnerState,UnityEngine.VFX.VFXExpressionValues,UnityEngine.VFX.VisualEffect) */,
	{ 0, 0, 0 } /* System.Void UnityEngine.VFX.VFXSpawnerCallbacks::OnStop(UnityEngine.VFX.VFXSpawnerState,UnityEngine.VFX.VFXExpressionValues,UnityEngine.VFX.VisualEffect) */,
	{ 0, 0, 0 } /* System.Void UnityEngine.VFX.VFXSpawnerCallbacks::.ctor() */,
	{ 0, 0, 0 } /* System.Void UnityEngine.VFX.VFXSpawnerState::.ctor(System.IntPtr,System.Boolean) */,
	{ 19, 4, 1 } /* UnityEngine.VFX.VFXSpawnerState UnityEngine.VFX.VFXSpawnerState::CreateSpawnerStateWrapper() */,
	{ 31, 5, 1 } /* System.Void UnityEngine.VFX.VFXSpawnerState::SetWrapValue(System.IntPtr) */,
	{ 58, 6, 1 } /* System.Void UnityEngine.VFX.VFXSpawnerState::Release() */,
	{ 0, 0, 0 } /* System.Void UnityEngine.VFX.VFXSpawnerState::Finalize() */,
	{ 0, 0, 0 } /* System.Void UnityEngine.VFX.VFXSpawnerState::Dispose() */,
	{ 0, 0, 0 } /* System.Void UnityEngine.VFX.VFXSpawnerState::Internal_Destroy(System.IntPtr) */,
	{ 0, 0, 0 } /* System.Void UnityEngine.VFX.VisualEffectObject::.ctor() */,
	{ 0, 0, 0 } /* System.Void UnityEngine.VFX.VisualEffectAsset::.ctor() */,
	{ 0, 0, 0 } /* System.Void UnityEngine.VFX.VisualEffectAsset::.cctor() */,
	{ 0, 0, 0 } /* System.Void UnityEngine.VFX.VFXOutputEventArgs::.ctor(System.Int32,UnityEngine.VFX.VFXEventAttribute) */,
	{ 0, 0, 0 } /* UnityEngine.VFX.VisualEffectAsset UnityEngine.VFX.VisualEffect::get_visualEffectAsset() */,
	{ 39, 7, 1 } /* UnityEngine.VFX.VFXEventAttribute UnityEngine.VFX.VisualEffect::CreateVFXEventAttribute() */,
	{ 54, 8, 1 } /* UnityEngine.VFX.VFXEventAttribute UnityEngine.VFX.VisualEffect::InvokeGetCachedEventAttributeForOutputEvent_Internal(UnityEngine.VFX.VisualEffect) */,
	{ 29, 9, 1 } /* System.Void UnityEngine.VFX.VisualEffect::InvokeOutputEventReceived_Internal(UnityEngine.VFX.VisualEffect,System.Int32) */,
};
#else
static const Il2CppMethodHeaderInfo g_methodHeaderInfos[1] = { { 0, 0, 0 } };
#endif
IL2CPP_EXTERN_C const Il2CppDebuggerMetadataRegistration g_DebuggerMetadataRegistrationUnityEngine_VFXModule;
const Il2CppDebuggerMetadataRegistration g_DebuggerMetadataRegistrationUnityEngine_VFXModule = 
{
	(Il2CppMethodExecutionContextInfo*)g_methodExecutionContextInfos,
	(Il2CppMethodExecutionContextInfoIndex*)g_methodExecutionContextInfoIndexes,
	(Il2CppMethodScope*)g_methodScopes,
	(Il2CppMethodHeaderInfo*)g_methodHeaderInfos,
	(Il2CppSequencePointSourceFile*)g_sequencePointSourceFiles,
	165,
	(Il2CppSequencePoint*)g_sequencePointsUnityEngine_VFXModule,
	0,
	(Il2CppCatchPoint*)g_catchPoints,
	7,
	(Il2CppTypeSourceFilePair*)g_typeSourceFiles,
	(const char**)g_methodExecutionContextInfoStrings,
};
