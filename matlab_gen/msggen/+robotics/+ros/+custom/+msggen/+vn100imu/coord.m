classdef coord < robotics.ros.Message
    %coord MATLAB implementation of vn100imu/coord
    %   This class was automatically generated by
    %   robotics.ros.msg.internal.gen.MessageClassGenerator.
    
    %   Copyright 2017 The MathWorks, Inc.
    
    %#ok<*INUSD>
    
    properties (Constant)
        MessageType = 'vn100imu/coord' % The ROS message type
    end
    
    properties (Constant, Hidden)
        MD5Checksum = 'c63aecb41bfdfd6b7e1fac37c7cbe7bf' % The MD5 Checksum of the message definition
    end
    
    properties (Access = protected)
        JavaMessage % The Java message object
    end
    
    properties (Constant, Access = protected)
        GeometryMsgsPointClass = robotics.ros.msg.internal.MessageFactory.getClassForType('geometry_msgs/Point') % Dispatch to MATLAB class for message type geometry_msgs/Point
        StdMsgsHeaderClass = robotics.ros.msg.internal.MessageFactory.getClassForType('std_msgs/Header') % Dispatch to MATLAB class for message type std_msgs/Header
    end
    
    properties (Dependent)
        Header
        Point
    end
    
    properties (Access = protected)
        Cache = struct('Header', [], 'Point', []) % The cache for fast data access
    end
    
    properties (Constant, Hidden)
        PropertyList = {'Header', 'Point'} % List of non-constant message properties
        ROSPropertyList = {'header', 'point'} % List of non-constant ROS message properties
    end
    
    methods
        function obj = coord(msg)
            %coord Construct the message object coord
            import com.mathworks.toolbox.robotics.ros.message.MessageInfo;
            
            % Support default constructor
            if nargin == 0
                obj.JavaMessage = obj.createNewJavaMessage;
                return;
            end
            
            % Construct appropriate empty array
            if isempty(msg)
                obj = obj.empty(0,1);
                return;
            end
            
            % Make scalar construction fast
            if isscalar(msg)
                % Check for correct input class
                if ~MessageInfo.compareTypes(msg(1), obj.MessageType)
                    error(message('robotics:ros:message:NoTypeMatch', obj.MessageType, ...
                        char(MessageInfo.getType(msg(1))) ));
                end
                obj.JavaMessage = msg(1);
                return;
            end
            
            % Check that this is a vector of scalar messages. Since this
            % is an object array, use arrayfun to verify.
            if ~all(arrayfun(@isscalar, msg))
                error(message('robotics:ros:message:MessageArraySizeError'));
            end
            
            % Check that all messages in the array have the correct type
            if ~all(arrayfun(@(x) MessageInfo.compareTypes(x, obj.MessageType), msg))
                error(message('robotics:ros:message:NoTypeMatchArray', obj.MessageType));
            end
            
            % Construct array of objects if necessary
            objType = class(obj);
            for i = 1:length(msg)
                obj(i,1) = feval(objType, msg(i)); %#ok<AGROW>
            end
        end
        
        function header = get.Header(obj)
            %get.Header Get the value for property Header
            if isempty(obj.Cache.Header)
                obj.Cache.Header = feval(obj.StdMsgsHeaderClass, obj.JavaMessage.getHeader);
            end
            header = obj.Cache.Header;
        end
        
        function set.Header(obj, header)
            %set.Header Set the value for property Header
            validateattributes(header, {obj.StdMsgsHeaderClass}, {'nonempty', 'scalar'}, 'coord', 'Header');
            
            obj.JavaMessage.setHeader(header.getJavaObject);
            
            % Update cache if necessary
            if ~isempty(obj.Cache.Header)
                obj.Cache.Header.setJavaObject(header.getJavaObject);
            end
        end
        
        function point = get.Point(obj)
            %get.Point Get the value for property Point
            if isempty(obj.Cache.Point)
                obj.Cache.Point = feval(obj.GeometryMsgsPointClass, obj.JavaMessage.getPoint);
            end
            point = obj.Cache.Point;
        end
        
        function set.Point(obj, point)
            %set.Point Set the value for property Point
            validateattributes(point, {obj.GeometryMsgsPointClass}, {'nonempty', 'scalar'}, 'coord', 'Point');
            
            obj.JavaMessage.setPoint(point.getJavaObject);
            
            % Update cache if necessary
            if ~isempty(obj.Cache.Point)
                obj.Cache.Point.setJavaObject(point.getJavaObject);
            end
        end
    end
    
    methods (Access = protected)
        function resetCache(obj)
            %resetCache Resets any cached properties
            obj.Cache.Header = [];
            obj.Cache.Point = [];
        end
        
        function cpObj = copyElement(obj)
            %copyElement Implements deep copy behavior for message
            
            % Call default copy method for shallow copy
            cpObj = copyElement@robotics.ros.Message(obj);
            
            % Clear any existing cached properties
            cpObj.resetCache;
            
            % Create a new Java message object
            cpObj.JavaMessage = obj.createNewJavaMessage;
            
            % Recursively copy compound properties
            cpObj.Header = copy(obj.Header);
            cpObj.Point = copy(obj.Point);
        end
        
        function reload(obj, strObj)
            %reload Called by loadobj to assign properties
            obj.Header = feval([obj.StdMsgsHeaderClass '.loadobj'], strObj.Header);
            obj.Point = feval([obj.GeometryMsgsPointClass '.loadobj'], strObj.Point);
        end
    end
    
    methods (Access = ?robotics.ros.Message)
        function strObj = saveobj(obj)
            %saveobj Implements saving of message to MAT file
            
            % Return an empty element if object array is empty
            if isempty(obj)
                strObj = struct.empty;
                return
            end
            
            strObj.Header = saveobj(obj.Header);
            strObj.Point = saveobj(obj.Point);
        end
    end
    
    methods (Static, Access = {?matlab.unittest.TestCase, ?robotics.ros.Message})
        function obj = loadobj(strObj)
            %loadobj Implements loading of message from MAT file
            
            % Return an empty object array if the structure element is not defined
            if isempty(strObj)
                obj = robotics.ros.custom.msggen.vn100imu.coord.empty(0,1);
                return
            end
            
            % Create an empty message object
            obj = robotics.ros.custom.msggen.vn100imu.coord;
            obj.reload(strObj);
        end
    end
end
