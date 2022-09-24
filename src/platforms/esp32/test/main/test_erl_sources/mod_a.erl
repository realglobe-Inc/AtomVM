%
% This file is part of AtomVM.
%
% Copyright 2022 Davide Bettio <davide@uninstall.it>
%
% Licensed under the Apache License, Version 2.0 (the "License");
% you may not use this file except in compliance with the License.
% You may obtain a copy of the License at
%
%    http://www.apache.org/licenses/LICENSE-2.0
%
% Unless required by applicable law or agreed to in writing, software
% distributed under the License is distributed on an "AS IS" BASIS,
% WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
% See the License for the specific language governing permissions and
% limitations under the License.
%
% SPDX-License-Identifier: Apache-2.0 OR LGPL-2.1-or-later
%

-module(mod_a).
-export([proc1/2]).

-include("intervals.hrl").

proc1(Pid, RRef) ->
    erlang:display(foo1),
    R = erlang:make_ref(),
    receive
        R -> unreachable
    after ?INTERVAL_1 ->
        Pid ! {foo1, self(), [RRef]}
    end,
    bar.
