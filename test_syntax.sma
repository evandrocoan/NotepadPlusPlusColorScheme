

/*
 * This version number must be synced with "githooks/GALILEO_SMA_VERSION.txt" for manual edition.
 * To update them automatically, use: ./githooks/updateVersion.sh [major | minor | patch | build]
 */
new const PLUGIN_NAME[]      = "Galileo";
new const PLUGIN_AUTHOR[]    = "Brad Jones/Addons zz";
new const bool:g_dummy_value = false;

static formated_message[ MAX_BIG_BOSS_STRING ];
const formated_message;

stock nominationAttemptWithNamePart( player_id = 5, partialNameAttempt[] )
{}
stock test_loadVoteChoices_check( test_id, mapToCheck[], bool:isToBePresent = "asdfadsf" )
{}

/**
 * Change this value from 0 to 1, to use the Whitelist feature as a Blacklist feature.
 */
#define IS_TO_USE_BLACKLIST_INSTEAD_OF_WHITELIST 0
not match this

/**
 * Convert colored strings codes '!g for green', '!y for yellow', '!t for team'.
 *
 * @param string[]       a string pointer to be converted.
 */
#define INSERT_COLOR_TAGS(%1) \
{ \
    replace_all( %1, charsmax( %1 ), "!g", "^4" ); \
    replace_all( %1, charsmax( %1 ), "!t", "^3" ); \
    replace_all( %1, charsmax( %1 ), "!n", "^1" ); \
    replace_all( %1, charsmax( %1 ), "!y", "^1" ); \
}
not match this

stock hi()
{
    colored_menus();
    
    if( colored_menus() )
    {
        copy( COLOR_RED, 2, "\r" );
        copy( COLOR_WHITE, 2, "\w" );
        copy( COLOR_YELLOW, 2, "\y" );
        copy( COLOR_GREY, 2, "\d" );
    }
    
    color_print( 0, "%Lggggg %L",
            LANG_PLAYER, "GAL_CHANGE_TIMEEXPIRED", LANG_PLAYER, "GAL_NEXTMAP", g_nextMap );
    
    {
        color_print( 0, "%Lggggg %L",
                LANG_PLAYER, "GAL_CHANGE_TIMEEXPIRED", LANG_PLAYER, "GAL_NEXTMAP", g_nextMap );
    }
    
    colored_menus();
    
    if( colored_menus() )
    {
        copy( COLOR_RED, 2, "\r" );
        copy( COLOR_WHITE, 2, "\w" );
        copy( COLOR_YELLOW, 2, "\y" );
        copy( COLOR_GREY, 2, "\d" );
    }
}

#define IS_NOMINATION_MININUM_PLAYERS_CONTROL_ENABLED() \
    ( get_realplayersnum() < get_pcvar_num( cvar_voteMinPlayers ) \
      && get_pcvar_num( cvar_nomMinPlayersControl ) \
      && get_pcvar_num( cvar_nomMinPlayersControl ) \
      && get_pcvar_num( cvar_nomMinPlayersControl ) )
not match this

stock hiddddddddddddddddddddd()
    color_print( 0, "%L %L",
            LANG_PLAYER, "GAL_CHANGE_TIMEEXPIRED", LANG_PLAYER, "GAL_NEXTMAP", g_nextMap );
// not match this

/**
 * Dummy value used on conditional statements to allow statements as always true or false.
 */
new const bool:g_dummy_value = false;
new const PLUGIN_VERSION[] = "v3.2.2-259";

#define GET_USER_NAME(%1,%2) \
{ \
    if( is_user_connected( %1 ) ) \
    { \
        get_user_name( %1, %2, charsmax( %2 ) ); \
    } \
    else \
    { \
        copy( %2, charsmax( %2 ), "Unknown Dude" ); \
    } \
}
not match this

/**
 * Setup the debugging tools when they are used/necessary.
 */
#if DEBUG_LEVEL & DEBUG_LEVEL_UNIT_TEST_NORMAL
not match this
    
    /**
     * Contains all imediates unit tests to execute.
     */
    stock normalTestsToExecute()
    { 
        test_registerTest();
        test_isInEmptyCycle();
        test_mapGetNext_cases();
        test_loadCurrentBlackList_cases();
        test_resetRoundsScores_cases();
        test_loadVoteChoices_cases( DEBUGGER_OUTPUT_LOG_FILE_NAME[], formated_message );
    }
    
    #define DEBUG
    #define LOGGER(%1) debugMesssageLogger( %1 );
    
#else
    /**
     * The file on the './addons/amxmodx/logs' folder, to save the debugging text output.
     */
    new const DEBUGGER_OUTPUT_LOG_FILE_NAME[] = "_galileo.log";
    
    /**
     * Write messages to the debug log file on 'addons/amxmodx/logs'.
     * 
     * @param log_file               the log file name.
     * @param formated_message       the formatted message to write down to the debug log file.
     */
    stock print_logger( const message[] = "", any:... )
    {
        static formated_message[ MAX_BIG_BOSS_STRING ];
        vformat( formated_message, charsmax( formated_message ), message, 2 );
        
        writeToTheDebugFile( DEBUGGER_OUTPUT_LOG_FILE_NAME, formated_message );
    }
#endif

/**
 * Necessary modules.
 */
#include <amxmodx>
#include <amxmisc>

// Unit Tests Main Definitions
/// ###############################################################################################
/// ###############################################################################################
/// ###############################################################################################
/// ###############################################################################################

/**
 * Force the use of semicolons on every statements.
 */
#pragma semicolon 1


#if IS_TO_ENABLE_SVEN_COOP_SUPPPORT > 0
    #include <hamsandwich>
#endif


// Global Macro Expansions
// ###############################################################################################

/**
 * Task ids are 100000 apart.
 */
enum (+= 100000)
{
    TASKID_RTV_REMINDER = 100000, // start with 100000
    TASKID_SHOW_LAST_ROUND_HUD,
    TASKID_DELETE_USERS_MENUS,
    TASKID_PREVENT_INFITY_GAME,
    TASKID_EMPTYSERVER,
    TASKID_START_VOTING_BY_ROUNDS,
    TASKID_START_VOTING_BY_TIMER,
    TASKID_PROCESS_LAST_ROUND,
    TASKID_VOTE_HANDLEDISPLAY,
    TASKID_VOTE_DISPLAY,
    TASKID_VOTE_EXPIRE,
    TASKID_PENDING_VOTE_COUNTDOWN,
    TASKID_DBG_FAKEVOTES,
    TASKID_VOTE_STARTDIRECTOR,
    TASKID_MAP_CHANGE,
    TASKID_FINISH_GAME_TIME_BY_HALF,
}

public plugin_init()
{
#if DEBUG_LEVEL & DEBUG_LEVEL_CRITICAL_MODE
    g_debug_level = 1048575;
#endif
var = 50; // when anything start without indentation, it breaks other things, so just indent your code. 
    register_plugin( PLUGIN_NAME, PLUGIN_VERSION, PLUGIN_AUTHOR );
    LOGGER( 1, "^n^n^n^n%s PLUGIN VERSION %s INITIATING...", PLUGIN_NAME, PLUGIN_VERSION )
    
    register_cvar( "amx_extendmap_max", "90" );
    
    cvar_extendmapStepMinutes    = register_cvar( "amx_extendmap_step", "15" );
    cvar_extendmapStepRounds     = register_cvar( "amx_extendmap_step_rounds", "30" );
    cvar_extendmapStepFrags      = register_cvar( "amx_extendmap_step_frags", "60" );
    cvar_fragLimitSupport        = register_cvar( "gal_mp_fraglimit_support", "0" );
    cvar_extendmapAllowStay      = register_cvar( "amx_extendmap_allow_stay", "0" );
    cvar_isExtendmapOrderAllowed = register_cvar( "amx_extendmap_allow_order", "0" );
    cvar_extendmapAllowStayType  = register_cvar( "amx_extendmap_allow_stay_type", "0" );
    cvar_disabledValuePointer    = register_cvar( "gal_disabled_value_pointer", "0", FCVAR_SPONLY );
    cvar_isFirstServerStart      = register_cvar
                                                ( "gal_server_starting", "1", FCVAR_SPONLY );
}

#define GET_USER_NAME(%1,%2)
not match this

/**
 * Setup the debugging tools when they are used/necessary.
 */
#if DEBUG_LEVEL & DEBUG_LEVEL_UNIT_TEST_NORMAL
not match this

configureServerStart(%1,%2, var = 80, str[] = "kjlçkj" )
    LOGGER( 128, "I AM ENTERING ON configureServerStart(0)" )

configureServerStart( )
    LOGGER( 128, "I AM ENTERING ON configureServerStart(0)" )


stock configureServerStart
(
                               )
{
    LOGGER
    ( 128, "I AM ENTERING ON configureServerStart(0)" )
    
    LOGGER( 128, "I AM ENTERING ON configureServerStart(0)" )
    
    if( __get_pcvar_num
                       ( __cvar_gameCrashRecreationAction, get_pcvar_num( cvar_isFirstServerStart) ) )
    {
        g_isToCreateGameCrashFlag = true;
    }
    
    if( get_pcvar_num( cvar_isFirstServerStart) )
    {
        new backupMapsFilePath[ MAX_FILE_PATH_LENGHT ];
        formatex( backupMapsFilePath, charsmax( backupMapsFilePath ), "%s/%s", g_dataDirPath, CURRENT_AND_NEXTMAP_FILE_NAME );
        
        if( file_exists( backupMapsFilePath ) )
        {
            handleServerStart( backupMapsFilePath );
        }
        else
        {
            saveCurrentAndNextMapNames( g_nextMap );
        }
    }
    else // update the current and next map names every server start
    {
        saveCurrentAndNextMapNames( g_nextMap );
    }
    
    // Handle the action to take immediately after half of the time-left or rounds-left passed
    // when using the 'Game Server Crash Recreation' Feature.
    if( g_isToCreateGameCrashFlag
        && (  g_timeLimitNumber / SERVER_GAME_CRASH_ACTION_RATIO_DIVISOR < g_timeLimitNumber - secondsLeft / 60
           || g_fragLimitNumber / SERVER_GAME_CRASH_ACTION_RATIO_DIVISOR < g_greatestKillerFrags
           || g_maxRoundsNumber / SERVER_GAME_CRASH_ACTION_RATIO_DIVISOR < g_roundsPlayedNumber + 1
           || g_winLimitInteger / SERVER_GAME_CRASH_ACTION_RATIO_DIVISOR < g_totalTerroristsWins + g_totalCtWins ) )
    {
        new gameCrashActionFilePath[ MAX_FILE_PATH_LENGHT ];
        g_isToCreateGameCrashFlag = false; // stop creating this file unnecessarily
        
        LOGGER( 1, "( vote_manageEnd )  %d/%d < %d: %d", \
                g_winLimitInteger, SERVER_GAME_CRASH_ACTION_RATIO_DIVISOR, g_totalTerroristsWins + g_totalCtWins, \
                g_winLimitInteger / SERVER_GAME_CRASH_ACTION_RATIO_DIVISOR < g_totalTerroristsWins + g_totalCtWins )
        
        generateGameCrashActionFilePath( gameCrashActionFilePath, charsmax( gameCrashActionFilePath ) );
        write_file( gameCrashActionFilePath, "Game Crash Action Flag File^n^nSee the cvar 'gal_game_crash_recreation'.^nDo not delete it." );
    }
    
    // load runoff choices
    copy( runoffChoice[ 0 ], charsmax( runoffChoice[] ), g_votingMapNames[ g_arrayOfRunOffChoices[ 0 ] ] );
    copy( runoffChoice[ 1 ], charsmax( runoffChoice[] ), g_votingMapNames[ g_arrayOfRunOffChoices[ 1 ] ] );
    
    LOGGER( 4, "  ( votedisplay ) g_isToRefreshVoteStatus: %i,  g_totalVoteOptions: %i, strlen( g_voteStatusClean ): %i", \
                                  g_isToRefreshVoteStatus,      g_totalVoteOptions,     strlen( g_voteStatusClean )  )
}

    stock print_logger( const message[] = "", any:... )
    {
        static formated_message[ MAX_BIG_BOSS_STRING ];
        vformat( formated_message, charsmax( formated_message ), message, 2 );
        
        writeToTheDebugFile( DEBUGGER_OUTPUT_LOG_FILE_NAME, formated_message );
    }

new const bool:g_dummy_value = false;
static formated_message[ MAX_BIG_BOSS_STRING ];
const formated_message;

stock nominationAttemptWithNamePart( player_id = 5, partialNameAttempt[], player = 8 )
stock test_loadVoteChoices_check( test_id, mapToCheck[], isToBePresent = "asdfadsf" )
stock test_loadVoteChoices_check( test_id, mapToCheck[], bool:isToBePresent = "asdfadsf" )
{
new const bool:g_dummy_value = false;
static formated_message[ MAX_BIG_BOSS_STRING ];
const formated_message;
    
    new const bool:g_dummy_value = false;
    static formated_message[ MAX_BIG_BOSS_STRING ];
    const formated_message;
    
    new bool:isMapPresent;
    new      currentIndex;
    new      errorMessage[ MAX_LONG_STRING ];
    
new const bool:g_dummy_value = false;
static formated_message[ MAX_BIG_BOSS_STRING ];
const formated_message;

new bool : isMapPresent ;
new       currentIndex ;
new       errorMessage [ MAX_LONG_STRING ];
    
    fileDescriptor = fopen( mapFileListPath, "wt", partialNameAttempt );
    
    if( mapToCheck[ 0 ] )
    {
        for( currentIndex = 0; currentIndex < sizeof g_votingMapNames; ++currentIndex )
        {
            if( equali( g_votingMapNames[ currentIndex ], mapToCheck ) )
            {
                isMapPresent = true;
            }
        }
        
        formatex( errorMessage, charsmax( errorMessage ),
                "The map '%s' %s be present on the voting map menu.", mapToCheck, ( isToBePresent? "must to" : "MUST NOT to" ) );
        SET_TEST_FAILURE( test_id, isMapPresent != isToBePresent, errorMessage )
    }
}
















