package yahui.containers;

import nme.display.Sprite;
import nme.events.Event;
import nme.events.MouseEvent;
import nme.events.TimerEvent;
import nme.geom.Point;
import nme.Lib;
import nme.utils.Timer;
import yahui.controls.HScroll;
import yahui.controls.VScroll;
import yahui.core.Component;

class ScrollView extends Component {
	private var viewContent:Component;
	public var content(getContent, setContent):Component;
	
	private var scrollPos:Point;
	
	private var eventTarget:Sprite; // we want to use an event target as when controls, say, buttons are scroll we want them to lose mouse events while scrolling
	private var downPos:Point; // where the mouse down was detected (used for delta values)
	private var mouseDown:Bool = false;
	
	private var vscroll:VScroll;
	private var hscroll:HScroll;
	
	public var showHorizontalScroll:Bool = true;
	public var showVerticalScroll:Bool = true;
	
	private var autoHideScrolls:Bool = false;
	
	public var scrollSensitivity:Int = 0; // there are times when you dont want things to scroll instantly
	private var innerScrolls:Bool = false;
	
	public function new() {
		super();
		addStyleName("ScrollView");
		
		scrollPos = new Point(0, 0);
		eventTarget = new Sprite();
		eventTarget.visible = false;
		autoSize = false;
		autoHideScrolls = false;
		innerScrolls = false;
	}
	
	//************************************************************
	//                  OVERRIDES
	//************************************************************
	public override function initialize():Void {
		super.initialize();
		
		if (content == null) {
			content = new Component();
		}
		
		if (currentStyle != null && currentStyle.autoHideScrolls != null) {
			autoHideScrolls = currentStyle.autoHideScrolls;
		}
		if (currentStyle != null && currentStyle.innerScrolls != null) {
			innerScrolls = currentStyle.innerScrolls;
		}

		addChild(content);
		addChild(eventTarget);
		addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		addEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheel);
	}
	
	public override function resize():Void {
		super.resize();

		repositionScrolls();
		updateScrollRect();
		resizeEventTarget();
		bringToFront(eventTarget);
	}

	//************************************************************
	//                  EVENT HANDLERS
	//************************************************************
	private function onMouseDown(event:MouseEvent):Void {
		var inScroll:Bool = false;
		if (vscroll != null) {
			inScroll = vscroll.mouseOver;
		}
		if (hscroll != null && inScroll == false) {
			inScroll = hscroll.mouseOver;
		}
		
		if (inScroll == false && (content.height > innerHeight || content.width > innerWidth)) {
			downPos = new Point(event.stageX, event.stageY);
			mouseDown = true;
			root.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			root.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		}
	}
	
	private function onMouseMove(event:MouseEvent):Void {
		var inScroll:Bool = false;
		if (vscroll != null) {
			inScroll = vscroll.mouseOver;
		}
		if (hscroll != null && inScroll == false) {
			inScroll = hscroll.mouseOver;
		}
		//inScroll = false;
		if (mouseDown == true && inScroll == false) {
			var ypos:Float = event.stageY - downPos.y;
			var xpos:Float = event.stageX - downPos.x;
			if (Math.abs(xpos) >= scrollSensitivity  || Math.abs(ypos) >= scrollSensitivity) {
				eventTarget.visible = true;
				bringToFront(eventTarget);

				if (ypos != 0 && content.height > innerHeight) {
					scrollPos.y -= ypos;
					if (scrollPos.y < 0) {
						scrollPos.y = 0;
					}
					var maxY:Float = content.height - innerHeight;
					if (hscroll != null) {
						maxY += hscroll.height + spacingY;
					}
					if (scrollPos.y > maxY) {
						scrollPos.y = maxY;
					}
					
					if (vscroll != null) {
						vscroll.visible = true;
					}
				}

				if (xpos != 0 && content.width > innerWidth) {
					scrollPos.x -= xpos;
					if (scrollPos.x < 0) {
						scrollPos.x = 0;
					}
					var maxX:Float = content.width - innerWidth;
					if (vscroll != null) {
						maxX += vscroll.width + spacingX;
					}
					if (scrollPos.x > maxX) {
						scrollPos.x = maxX;
					}
					
					if (hscroll != null) {
						hscroll.visible = true;
					}
				}
				
				if (vscroll != null) {
					vscroll.value = Std.int(scrollPos.y);
				}
				if (hscroll != null) {
					hscroll.value = Std.int(scrollPos.x);
				}
				downPos = new Point(event.stageX, event.stageY);
				updateScrollRect();
			}
		}
	}
	
	private function onMouseUp(event:MouseEvent):Void {
		eventTarget.visible = false;
		mouseDown = false;
		root.removeEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
		root.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		
		if (autoHideScrolls == true) {
			if (vscroll != null) {
				vscroll.visible = false;
			}
			if (hscroll != null) {
				hscroll.visible = false;
			}
		}
	}
	
	private function onVScrollChange(event:Event):Void {
		scrollPos.y = vscroll.value;
		updateScrollRect();
	}
	
	private function onHScrollChange(event:Event):Void {
		scrollPos.x = hscroll.value;
		updateScrollRect();
	}
	
	private function onMouseWheel(event:MouseEvent):Void {
		if (vscroll != null) {
			if (event.delta != 0) {
				if (event.delta < 0) {
					vscroll.incrementValue();
				} else if (event.delta > 0) {
					vscroll.deincrementValue();
				}
				
				if (autoHideScrolls == true) {
					vscroll.visible = true;
					hideScrollsWithDelay();
				}
			}
		}
	}
	
	private function onTimerComplete(event:TimerEvent):Void {
		hideScrollsTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
		if (vscroll != null && autoHideScrolls == true) {
			vscroll.visible = false;
		}
		if (hscroll != null && autoHideScrolls == true) {
			hscroll.visible = false;
		}
	}
	
	//************************************************************
	//                  GETTERS AND SETTERS
	//************************************************************
	public function setContent(value:Component):Component {
		if (viewContent != null) {
			removeChild(viewContent);
			content = null;
		}
		
		viewContent = value;
		if (ready) {
			addChild(viewContent);
		}
		
		return viewContent;
	}
	
	public function getContent():Component {
		return viewContent;
	}
	
	//************************************************************
	//                  HELPERS
	//************************************************************
	private var hideScrollsTimer:Timer;
	public function hideScrollsWithDelay():Void {
		if (hideScrollsTimer == null) {
			hideScrollsTimer = new Timer(100, 1);
		}
		hideScrollsTimer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
		hideScrollsTimer.reset();
		hideScrollsTimer.start();
	}
	
	private function repositionScrolls():Void {
		if (content.height > innerHeight && showVerticalScroll == true) {
			if (vscroll == null) {
				vscroll = new VScroll();
				vscroll.addEventListener(Event.CHANGE, onVScrollChange);
				addChild(vscroll);
			}
			
			if (innerScrolls == false && content.padding.right != vscroll.width + spacingX) {
				content.padding.right = vscroll.width + spacingX;
				content.invalidate();
			}
			vscroll.height = innerHeight;
			vscroll.x = innerWidth - vscroll.width;
			vscroll.visible = !autoHideScrolls;
		} else {
			if (vscroll != null) {
				vscroll.visible = false;
			}
			
			if (content.padding.right != 0) {
				content.padding.right = 0;
				content.invalidate();
			}
		}

		if (content.width > innerWidth && showHorizontalScroll == true) {
			if (hscroll == null) {
				hscroll = new HScroll();
				hscroll.addEventListener(Event.CHANGE, onHScrollChange);
				addChild(hscroll);
			}
			
			if (innerScrolls == false && content.padding.bottom != hscroll.height + spacingY) {
				content.padding.bottom = hscroll.height + spacingY;
				content.invalidate();
			}
			
			hscroll.width = innerWidth;
			hscroll.y = innerHeight - hscroll.height;
			hscroll.visible = !autoHideScrolls;
		} else {
			if (hscroll != null) {
				hscroll.visible = false;
			}
			if (content.padding.bottom != 0) {
				content.padding.bottom = 0;
				content.invalidate();
			}
		}
		
		if (vscroll != null && hscroll != null) {
			vscroll.height -= hscroll.height;
			hscroll.width -= vscroll.width;
		}
		
		// set scroll ranges after we have displayed/created scrolls so we know accurate max values
		if (vscroll != null) {
			var maxY:Float = content.height - innerHeight;
			if (hscroll != null) {
				maxY += hscroll.height + spacingY;
			}
			vscroll.max = maxY;
			vscroll.pageSize = (innerHeight / content.height) * vscroll.max;
		}
		
		if (hscroll != null) {
			var maxX:Float = content.width - innerWidth;
			if (vscroll != null) {
				maxX += vscroll.width + spacingX;
			}
			hscroll.max = maxX;
			hscroll.pageSize = (innerWidth / content.width) * hscroll.max;
		}
	}
	
	private function resizeEventTarget():Void {
		if (eventTarget != null) {
			var targetX:Float = padding.left;
			var targetY:Float = padding.top;
			var targetCX:Float = width - (padding.left + padding.right);
			var targetCY:Float = height - (padding.top + padding.bottom);
			if (vscroll != null) {
				targetCX -= vscroll.width;
			}
			if (hscroll != null) {
				targetCY -= hscroll.height;
			}
			
			eventTarget.alpha = 0;
			eventTarget.graphics.clear();
			eventTarget.graphics.beginFill(0xFF00FF);
			eventTarget.graphics.lineStyle(0);
			eventTarget.graphics.drawRect(targetX, targetY, targetCX, targetCY);
			eventTarget.graphics.endFill();
		}
	}
	
	private function updateScrollRect():Void {
		if (content != null) {
			var scrollWidth = width - (padding.left + padding.right);
			var scrollHeight = height - (padding.top + padding.bottom);
			if (vscroll != null && vscroll.visible == true && innerScrolls == false) {
				scrollWidth -= vscroll.width + spacingX;
			}
			
			if (hscroll != null && hscroll.visible == true && innerScrolls == false) {
				scrollHeight -= hscroll.height + spacingY;
			}
			content.setScrollRect(scrollPos.x, scrollPos.y, scrollWidth, scrollHeight);
		}
	}
}