module Main where

import Control.Concurrent (threadDelay)
import System.IO (hFlush, stdout)

workDuration :: Int
workDuration = 25 * 60  -- 25 minutes

breakDuration :: Int
breakDuration = 5 * 60  -- 5 minutes

-- Format seconds as MM:SS
formatTime :: Int -> String
formatTime s =
  let (m, s') = s `divMod` 60
  in pad m ++ ":" ++ pad s'
  where pad n = if n < 10 then '0' : show n else show n

-- Countdown function
countdown :: Int -> String -> IO ()
countdown secs label = do
  putStrLn $ "\n=== " ++ label ++ " (" ++ formatTime secs ++ ") ==="
  countdownLoop secs
  putStrLn $ "\n" ++ label ++ " complete!"

countdownLoop :: Int -> IO ()
countdownLoop 0 = return ()
countdownLoop t = do
  putStr $ "\rTime left: " ++ formatTime t
  hFlush stdout
  threadDelay 1000000  -- 1 second
  countdownLoop (t - 1)

-- Pomodoro loop
pomodoro :: IO ()
pomodoro = do
  countdown workDuration "Work Session"
  countdown breakDuration "Break Time"
  putStrLn "Cycle complete. Starting over..."
  pomodoro

main :: IO ()
main = do
  putStrLn "Pomodoro Timer (Ctrl+C to exit)"
  pomodoro
