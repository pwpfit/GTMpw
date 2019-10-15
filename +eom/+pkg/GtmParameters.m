classdef GtmParameters < aerootools.pkg.EOMvector
% Parameters for the GTM equations of motion.
%
%% About
%
% * Author:     Torbjoern Cunis
% * Email:      <mailto:tcunis@umich.edu>
% * Created:    2019-03-17
% * Changed:    2019-03-17
%
% This file is part of GTMpw -- Piecewise polynomial model of the GTM
% published under the GNU General Public License v3.
%
%% See also
%
% See aerotools.pkg.BASICPARAMETERS
%
%%

properties (Access=protected)
end

methods
    function obj = GtmParameters(varargin)
        % GTM parameters.
        obj@aerootools.pkg.EOMvector(0,varargin{:})
    end
    
    function pr = eps(mu)
        pr = index(mu,1);
    end
end

methods (Static, Access=protected)
    function [tf, default] = check(obj, default, varargin)
    % Overriding EOMvector.check
        
        if isempty(varargin)
            tf = 0;
        elseif length(varargin) == 1 && isa(varargin{1}, class(obj))
            tf = 1;
        elseif length(varargin) == 1 && size(varargin{1},1) <= length(default)
            tf = 2;
        elseif length(varargin) == 1 && size(varargin{1},2) <= length(default)
            tf = 3;
        elseif length(varargin) <= length(default)
            tf = 4;
        else
            tf = -1;
        end
    end
end

end