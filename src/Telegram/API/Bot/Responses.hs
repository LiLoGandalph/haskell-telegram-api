{-# LANGUAGE DataKinds         #-}
{-# LANGUAGE DeriveGeneric     #-}
{-# LANGUAGE DeriveAnyClass    #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators     #-}
{-# LANGUAGE TemplateHaskell   #-}
{-# LANGUAGE FlexibleContexts  #-}

module Telegram.API.Bot.Responses
    (
      GetMeResponse           (..)
    , MessageResponse     (..)
    ) where

import           Data.Aeson
import           Data.Aeson.Types
import           Data.Maybe
import           Data.Proxy
import           Data.Text (Text)
import qualified Data.Text as T
import           GHC.Generics
import           GHC.TypeLits
import           Telegram.API.Bot.Data
import           Telegram.API.Bot.JsonExt

data GetMeResponse = GetMeResponse
  {
    user_result :: User
  } deriving (Show, Generic)

instance ToJSON GetMeResponse where
  toJSON = toJsonDrop 5

instance FromJSON GetMeResponse where
  parseJSON = parseJsonDrop 5

data MessageResponse = MessageResponse
  {
    message_result :: Message
  } deriving (Show, Generic)

instance ToJSON MessageResponse where
  toJSON = toJsonDrop 8

instance FromJSON MessageResponse where
  parseJSON = parseJsonDrop 8