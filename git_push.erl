-module(git_push).
-export([push_file/3]).

hejhopp

push_file(FilePath, RepoUrl, AccessToken) ->
    {ok, FileContent} = file:read_file(FilePath),
    FileName = filename:basename(FilePath),
    io:format("FileName ~p~n",[FileName]),
  %  Url = RepoUrl ++ "/contents/" ++ FileName,
    Url = RepoUrl ++"/"++FileName,
    io:format("Url ~p~n",[Url]),
  

    Body = #{ "message" => "add " ++ FileName,
              "content" => base64:encode(FileContent) },
    io:format("Body ~p~n",[Body]),
    Headers = [{"Authorization", "token " ++ AccessToken},{"User-Agent", "joq62"}],
    io:format("Headers ~p~n",[Headers]),
%    Headers = [{"Authorization", "token " ++ AccessToken},{"User-Agent", "Erlang"}],

    {ok, Response} = httpc:request(post, {Url, Headers, "application/json", Body}, [], []),
    Response.
