﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.5466
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Nexus.Client.Games.WorldOfTanks.Properties {
    using System;
    
    
    /// <summary>
    ///   A strongly-typed resource class, for looking up localized strings, etc.
    /// </summary>
    // This class was auto-generated by the StronglyTypedResourceBuilder
    // class via a tool like ResGen or Visual Studio.
    // To add or remove a member, edit your .ResX file then rerun ResGen
    // with the /str option, or rebuild your VS project.
    [global::System.CodeDom.Compiler.GeneratedCodeAttribute("System.Resources.Tools.StronglyTypedResourceBuilder", "2.0.0.0")]
    [global::System.Diagnostics.DebuggerNonUserCodeAttribute()]
    [global::System.Runtime.CompilerServices.CompilerGeneratedAttribute()]
    internal class Resources {
        
        private static global::System.Resources.ResourceManager resourceMan;
        
        private static global::System.Globalization.CultureInfo resourceCulture;
        
        [global::System.Diagnostics.CodeAnalysis.SuppressMessageAttribute("Microsoft.Performance", "CA1811:AvoidUncalledPrivateCode")]
        internal Resources() {
        }
        
        /// <summary>
        ///   Returns the cached ResourceManager instance used by this class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        internal static global::System.Resources.ResourceManager ResourceManager {
            get {
                if (object.ReferenceEquals(resourceMan, null)) {
                    global::System.Resources.ResourceManager temp = new global::System.Resources.ResourceManager("Nexus.Client.Games.WorldOfTanks.Properties.Resources", typeof(Resources).Assembly);
                    resourceMan = temp;
                }
                return resourceMan;
            }
        }
        
        /// <summary>
        ///   Overrides the current thread's CurrentUICulture property for all
        ///   resource lookups using this strongly typed resource class.
        /// </summary>
        [global::System.ComponentModel.EditorBrowsableAttribute(global::System.ComponentModel.EditorBrowsableState.Advanced)]
        internal static global::System.Globalization.CultureInfo Culture {
            get {
                return resourceCulture;
            }
            set {
                resourceCulture = value;
            }
        }
        
        /// <summary>
        ///   Looks up a localized string similar to &lt;?xml version=&quot;1.0&quot; encoding=&quot;utf-8&quot;?&gt;
        ///&lt;categoryManager fileVersion=&quot;0.1.0.0&quot;&gt;
        ///  &lt;categoryList&gt;
        ///    &lt;category path=&quot;Flags&quot; ID=&quot;109&quot;&gt;
        ///      &lt;name&gt;Flags&lt;/name&gt;
        ///    &lt;/category&gt;
        ///    &lt;category path=&quot;Hangars&quot; ID=&quot;108&quot;&gt;
        ///      &lt;name&gt;Hangars&lt;/name&gt;
        ///    &lt;/category&gt;
        ///    &lt;category path=&quot;Icons&quot; ID=&quot;107&quot;&gt;
        ///      &lt;name&gt;Icons&lt;/name&gt;
        ///    &lt;/category&gt;
        ///    &lt;category path=&quot;Miscellaneous&quot; ID=&quot;102&quot;&gt;
        ///      &lt;name&gt;Miscellaneous&lt;/name&gt;
        ///    &lt;/category&gt;
        ///    &lt;category path=&quot;Skins - Crew&quot; ID=&quot;101&quot;&gt;
        ///      &lt;name&gt;Skins - Crew [rest of string was truncated]&quot;;.
        /// </summary>
        internal static string Categories {
            get {
                return ResourceManager.GetString("Categories", resourceCulture);
            }
        }
        
        internal static System.Drawing.Icon wot_logo {
            get {
                object obj = ResourceManager.GetObject("wot_logo", resourceCulture);
                return ((System.Drawing.Icon)(obj));
            }
        }
    }
}
